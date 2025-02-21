<?php

namespace App\Filament\Widgets;

use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;
use App\Models\Order;
use Illuminate\Support\Carbon;
use Filament\Tables\Filters\Filter;
use Filament\Forms\Components\ToggleButtons;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Enums\FiltersLayout;

class LatestOrders extends BaseWidget
{
    protected static ?string $heading = null; // Removes the default heading if any
    
    protected function getTableHeading(): ?string
    {
        return null; // Hides the table heading
    }

    protected static ?string $maxContentWidth = null; // Ensures no max width is applied

    public function table(Table $table): Table
    {
        return $table
            ->query(
                Order::query()
                    ->whereDate('created_at', Carbon::today()) // Filter orders created today
                    ->latest('created_at') // Order by the latest created orders
            )
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->label('Order Id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Customer Name')
                    ->sortable(),
                Tables\Columns\TextColumn::make('o_status')
                    ->label('Order Status')
                    ->badge()
                    ->color(fn(string $state): string => match ($state) {
                        'Pending' => 'warning',      // Yellow for Pending
                        'Processing' => 'info',      // Blue for Processing
                        'On Route' => 'primary',     // Dark Blue for On Route
                        'Completed' => 'success',    // Green for Completed
                        'Cancelled' => 'danger',     // Red for Cancelled
                        default => 'secondary',      // Grey for unknown statuses
                    })
                    ->sortable(),
            ])
            ->filters([
                Filter::make('o_status')
                    ->form([
                        ToggleButtons::make('o_status')
                            ->label('')
                            ->options([
                                'Pending' => 'Pending',       // Yellow for Pending
                                'Processing' => 'Processing', // Blue for Processing
                                'On Route' => 'On Route',     // Dark Blue for On Route
                                'Completed' => 'Completed',   // Green for Completed
                                'Cancelled' => 'Cancelled',   // Red for Cancelled
                            ])
                            ->grouped(), // Groups the toggle buttons
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        if (!empty($data['o_status'])) {
                            return $query->where('o_status', $data['o_status']);
                        }
                        return $query;
                    }),
            ], layout: FiltersLayout::AboveContent);
    }

    protected function getTableContentGrid(): ?array
    {
        return [
            'sm' => 1,
            'md' => 1,
            'lg' => 1,
            'xl' => 1, // Full width for all screen sizes
        ];
    }
}
