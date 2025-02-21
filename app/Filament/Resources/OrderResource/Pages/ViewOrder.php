<?php

namespace App\Filament\Resources\OrderResource\Pages;

use App\Filament\Resources\OrderResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;

class ViewOrder extends ViewRecord
{
    protected static string $resource = OrderResource::class;

    public Order $order;

    // public function getTitle(): string
    // {
    //     return "View Order #{$this->order->id}";
    // }

    // public function getContent(): string
    // {
    //     return view('filament.resources.orders.view', [
    //         'order' => $this->order,
    //     ]);
    // }

    // public function getActions(): array
    // {
    //     return [
    //         Actions\Action::make('back')
    //             ->label('Back')
    //             ->url(route('filament.resources.orders.index')),
    //     ];
    // }
}
