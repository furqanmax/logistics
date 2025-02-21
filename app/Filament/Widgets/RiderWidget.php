<?php

namespace App\Filament\Widgets;

use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;
use App\Models\Rider;

use Illuminate\Support\Carbon;
use Filament\Tables\Filters\Filter;
use Filament\Forms\Components\ToggleButtons;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Enums\FiltersLayout;


class RiderWidget extends BaseWidget
{
    public function table(Table $table): Table
    {
        return $table
            ->query(
                Rider::query()
                ->whereDate('created_at', Carbon::today()) // Filter orders created today
                ->latest('created_at') // Order by the latest created orders
            )
            ->columns([

                Tables\Columns\TextColumn::make('status')
                ->label('Category Status')
                ->badge()
                ->formatStateUsing(fn ($state) => $state === 1 ? 'Published' : 'Unpublished')
                ->color(fn (string $state): string => match ($state) {
                    '1' => 'success',
                    '0' => 'danger',
                })
                ->sortable(),

                Tables\Columns\TextColumn::make('mobile')
                    ->searchable(),

                    Tables\Columns\TextColumn::make('vehicel.title')
                    ->numeric()
                    ->sortable(),
                    ]);
    }
}
