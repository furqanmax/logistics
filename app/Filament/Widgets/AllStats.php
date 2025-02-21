<?php

namespace App\Filament\Widgets;

use Carbon\Carbon;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use App\Models\Order;
use App\Models\User;

class AllStats extends BaseWidget
{
    protected function getStats(): array
    {
        // Define statuses and their associated icons
        $statuses = [
            'Pending' => 'heroicon-o-shopping-cart',       // Yellow for Pending
            'Processing' => 'heroicon-o-shopping-bag',    // Blue for Processing
            'On Route' => 'heroicon-o-truck',             // Dark Blue for On Route
            'Completed' => 'heroicon-o-check',            // Green for Completed
            'Cancelled' => 'heroicon-o-x-mark',           // Red for Cancelled
        ];

        // Define the base colors for each status
        $colors = [
            'Pending' => 'warning',
            'Processing' => 'info',
            'On Route' => 'primary',
            'Completed' => 'success',
            'Cancelled' => 'danger',
        ];

        // Generate stats dynamically based on the statuses
        $stats = [];
        foreach ($statuses as $status => $icon) {
            $count = Order::where('o_status', strtolower($status))
                ->whereDate('created_at', Carbon::today()) // Filter orders from today
                ->count();

            $chart = $this->generateHourlyChart($status);
            $color = $this->determineColor($count, $colors[$status]);

            $stats[] = Stat::make($status . ' Orders', $count)
                ->description("$status Orders")
                ->descriptionIcon($icon)
                ->chart($chart)
                ->color($color);
        }

        $stats[] = Stat::make('Users', User::count())
            ->description('Total numer of user')
            ->descriptionIcon('heroicon-o-user');

        return $stats;
    }

    /**
     * Generate chart data for the current day in hourly intervals.
     *
     * @param string $status
     * @return array
     */
    private function generateHourlyChart(string $status): array
    {
        $data = [];
        $currentDate = Carbon::today();

        for ($hour = 0; $hour < 24; $hour++) {
            $data[] = Order::where('o_status', strtolower($status))
                ->whereBetween('created_at', [
                    $currentDate->copy()->addHours($hour),
                    $currentDate->copy()->addHours($hour + 1)
                ])
                ->count();
        }

        return $data;
    }

    /**
     * Determine the color based on thresholds and default color.
     *
     * @param int $count
     * @param string $defaultColor
     * @return string
     */
    private function determineColor(int $count, string $defaultColor): string
    {
        if ($count > 50) {
            return 'danger';
        } elseif ($count > 20) {
            return 'warning';
        }
        return $defaultColor;
    }
}


