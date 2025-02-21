<?php

namespace App\Filament\Resources\PaymentListResource\Pages;

use App\Filament\Resources\PaymentListResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditPaymentList extends EditRecord
{
    protected static string $resource = PaymentListResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
