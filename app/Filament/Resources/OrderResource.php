<?php

namespace App\Filament\Resources;

use App\Filament\Resources\OrderResource\Pages;
use App\Filament\Resources\OrderResource\RelationManagers;
use App\Models\Order;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Tables\Actions\Action;
use Filament\Infolists;
use Filament\Infolists\Infolist;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Components\TextareaEntry;
use Filament\Infolists\Components\ImageEntry;
use Filament\Infolists\Components\BadgeEntry;
use Filament\Infolists\Components\Section;
use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\Split;
use Filament\Infolists\Components\Fieldset;
use Filament\Tables\Enums\FiltersLayout;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\BaseFilter;
use Filament\Tables\Filters\Filter;
use Filament\Forms\Components\ToggleButtons;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Radio;
use Carbon\Carbon;

use Filament\Tables\Filters\Indicator;




use Filament\Resources\Forms\Components\TextInput;

use Filament\Resources\Forms\Components\DateTimePicker;

use Filament\Tables\Filters\TernaryFilter;


use Filament\Support\Enums\FontWeight;

class OrderResource extends Resource
{
    protected static ?string $model = Order::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('uid')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('rid')
                    ->required()
                    ->numeric()
                    ->default(0),
                Forms\Components\TextInput::make('cat_id')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('dzone')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('vehicleid')
                    ->required()
                    ->numeric(),
                Forms\Components\Textarea::make('pick_address')
                    ->required()
                    ->columnSpanFull(),
                Forms\Components\Textarea::make('pick_lat')
                    ->required()
                    ->columnSpanFull(),
                Forms\Components\Textarea::make('pick_lng')
                    ->required()
                    ->columnSpanFull(),
                Forms\Components\TextInput::make('subtotal')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('o_total')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('cou_id')
                    ->required()
                    ->numeric(),
                Forms\Components\TextInput::make('cou_amt')
                    ->required()
                    ->numeric(),
                Forms\Components\Textarea::make('trans_id')
                    ->required()
                    ->columnSpanFull(),
                Forms\Components\TextInput::make('o_status')
                    ->required(),
                Forms\Components\TextInput::make('dcommission')
                    ->required()
                    ->numeric()
                    ->default(0.00),
                Forms\Components\TextInput::make('wall_amt')
                    ->numeric(),
                Forms\Components\TextInput::make('p_method_id')
                    ->required()
                    ->numeric(),
                Forms\Components\DateTimePicker::make('odate')
                    ->required(),
                Forms\Components\Textarea::make('rlats')
                    ->columnSpanFull(),
                Forms\Components\Textarea::make('rlongs')
                    ->columnSpanFull(),
                Forms\Components\DateTimePicker::make('delivertime'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([

                Tables\Columns\TextColumn::make('serial')
                ->label('S.No') // Label for the column
                ->getStateUsing(function ($rowLoop, $record) {
                    return $rowLoop->iteration; // Automatically increments for each row
                })
                ->sortable(false) // No sorting on this column
                ->searchable(false), // No search on this column
                Tables\Columns\TextColumn::make('id')
                    ->label('Order Id')
                    ->numeric()
                    ->sortable(),
                Tables\Columns\TextColumn::make('user.name')
                    ->label('Customer Name')
                    ->sortable(),
                // Tables\Columns\TextColumn::make('rid')
                //     ->numeric()
                //     ->sortable(),
                // Tables\Columns\TextColumn::make('cat_id')
                //     ->numeric()
                //     ->sortable(),
                // Tables\Columns\TextColumn::make('dzone')
                //     ->numeric()
                //     ->sortable(),
                // Tables\Columns\TextColumn::make('vehicleid')
                //     ->numeric()
                //     ->sortable(),
                // Tables\Columns\TextColumn::make('subtotal')
                //     ->numeric()
                //     ->sortable(),
                // Tables\Columns\TextColumn::make('o_total')
                //     ->numeric()
                //     ->sortable(),
                // Tables\Columns\TextColumn::make('cou_id')
                //     ->numeric()
                //     ->sortable(),
                // Tables\Columns\TextColumn::make('cou_amt')
                //     ->numeric()
                //     ->sortable(),
                Tables\Columns\TextColumn::make('o_status')
                    ->label('Order Status')
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'Pending' => 'warning',      // Yellow for Pending
                        'Processing' => 'info',      // Blue for Processing
                        'On Route' => 'primary',     // Dark Blue for On Route
                        'Completed' => 'success',    // Green for Completed
                        'Cancelled' => 'danger',     // Red for Cancelled
                        default => 'secondary',      // Grey for unknown statuses
                    })
                    ->sortable(),

                // Tables\Columns\TextColumn::make('dcommission')
                //     ->numeric()
                //     ->sortable(),
                // Tables\Columns\TextColumn::make('wall_amt')
                //     ->numeric()
                //     ->sortable(),
                // Tables\Columns\TextColumn::make('p_method_id')
                //     ->numeric()
                //     ->sortable(),
                // Tables\Columns\TextColumn::make('odate')
                //     ->dateTime()
                //     ->sortable(),
                // Tables\Columns\TextColumn::make('delivertime')
                //     ->dateTime()
                //     ->sortable(),
                // Tables\Columns\TextColumn::make('created_at')
                //     ->dateTime()
                //     ->sortable()
                //     ->toggleable(isToggledHiddenByDefault: true),
                // Tables\Columns\TextColumn::make('updated_at')
                //     ->dateTime()
                //     ->sortable()
                //     ->toggleable(isToggledHiddenByDefault: true),
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
                            ->icons([
                                'Pending' => 'heroicon-o-shopping-cart',       // Yellow for Pending
                                'Processing' => 'heroicon-o-shopping-bag', // Blue for Processing
                                'On Route' => 'heroicon-o-truck',     // Dark Blue for On Route
                                'Completed' => 'heroicon-o-check',   // Green for Completed
                                'Cancelled' => 'heroicon-o-x-mark',   // Red for Cancelled
                            ])
                            ->grouped(), // Groups the toggle buttons
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        if (!empty($data['o_status'])) {
                            return $query->where('o_status', $data['o_status']);
                        }
                        return $query;
                    }),
            ], layout: FiltersLayout::AboveContent)
             

          





            ->actions([
                Tables\Actions\ViewAction::make(),
                // Tables\Actions\EditAction::make(),
               
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }


    public static function infolist(Infolist $infolist): Infolist
{
    return $infolist
        ->schema([

            // TextEntry::make('cou_amt')
            // ->label('coupon amount:')
            // ->numeric()
            // ->columnSpanFull(),

            Split::make([
                Fieldset::make('Order Details')
                // ->aside()
                    
                    ->schema([
                        TextEntry::make('id')
                            ->label('Order No:'),
                        TextEntry::make('odate')
                            ->label('Order Date:'),
                        TextEntry::make('user.email')
                            ->label('Mobile Number:'),
                        TextEntry::make('user.name')
                            ->label('Customer Name:'),
                    ])->columnSpanFull()->columns(2),

                

                    Fieldset::make('Payment & Category & Vehicle Information')
                    // ->aside()
                        ->schema([
                            TextEntry::make('p_method_id')
                                ->label('Payment Gateway:'),
                            TextEntry::make('category.title')
                                ->label('Category:'),
                            TextEntry::make('vehicle.title')
                                ->label('Vehicle Type:'),
                        ])
                        ->columns(2)
                        ->grow(false),
            ])->from('md')->columnSpanFull(),

            Section::make('Pickup & Drop & Order Status Details')
                // ->aside()
                    ->schema([
                        TextEntry::make('pick_address')
                            ->label('Pickup Address:'),
                        TextEntry::make('pick_lat')
                            ->label('Pickup Name:'),
                        TextEntry::make('pick_lng')
                            ->label('Pickup Mobile:'),
                        TextEntry::make('o_status')
                            ->label('Order Status:')
                            ->badge()
                            ->colors([
                                'success' => fn ($state) => $state === 'Completed',
                                'warning' => fn ($state) => $state === 'On Route',
                                'danger' => fn ($state) => $state === 'Cancelled',
                                'info' => fn ($state) => $state === 'Pending',
                            ])
                            ->formatStateUsing(fn ($state) => match ($state) {
                                'Pending' => 'Pending',
                                'Processing' => 'Processing',
                                'On Route' => 'On Route',
                                'Completed' => 'Completed',
                                'Cancelled' => 'Cancelled',
                            }),
                    ])->columns(2),

            Section::make('Total Order Details')
            ->aside()
                ->schema([
                    TextEntry::make('subtotal')
                        ->label('Subtotal:')
                        ->numeric()->money('INR')
                        ->columnSpanFull(),
                    
                    TextEntry::make('o_total')
                        ->label('Net Amount (Remain To Pay):')
                        ->numeric()
                        ->columnSpanFull(),
                ]),

           

           
        ]);
}


    public static function getPages(): array
    {
        return [
            'index' => Pages\ListOrders::route('/'),
            'create' => Pages\CreateOrder::route('/create'),
            'edit' => Pages\EditOrder::route('/{record}/edit'),
            'view' => Pages\ViewOrder::route('/{record}'),
        ];
    }
}
