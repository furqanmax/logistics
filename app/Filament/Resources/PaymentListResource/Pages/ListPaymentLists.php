<?php

namespace App\Filament\Resources\PaymentListResource\Pages;

use App\Filament\Resources\PaymentListResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListPaymentLists extends ListRecords
{
    protected static string $resource = PaymentListResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
