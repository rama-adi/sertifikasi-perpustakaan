"use client"

import * as React from "react"
import { Check, ChevronsUpDown } from "lucide-react"

import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"
import {
    Command,
    CommandEmpty,
    CommandGroup,
    CommandInput,
    CommandItem,
    CommandList,
} from "@/components/ui/command"
import {
    Popover,
    PopoverContent,
    PopoverTrigger,
} from "@/components/ui/popover"

interface ComboboxOption {
    value: string;
    label: string;
}

interface ComboboxProps {
    options: ComboboxOption[];
    placeholder: string;
    emptyMessage: string;
    className?: string;
    value: string;
    onChange: (value: string) => void;
}

const ComboboxItem: React.FC<{
    option: ComboboxOption;
    isSelected: boolean;
    onSelect: (value: string) => void;
}> = ({ option, isSelected, onSelect }) => (
    <CommandItem
        key={option.value}
        value={option.value}
        onSelect={onSelect}
    >
        {option.label}
        <Check
            className={cn(
                "ml-auto",
                isSelected ? "opacity-100" : "opacity-0"
            )}
        />
    </CommandItem>
);

const ComboboxContent: React.FC<{
    options: ComboboxOption[];
    value: string;
    setOpen: (open: boolean) => void;
    placeholder: string;
    emptyMessage: string;
    onChange: (value: string) => void;
}> = ({ options, value, setOpen, placeholder, emptyMessage, onChange }) => (
    <Command>
        <CommandInput placeholder={placeholder} value={value} />
        <CommandList>
            <CommandEmpty>{emptyMessage}</CommandEmpty>
            <CommandGroup>
                {options.map((option) => (
                    <ComboboxItem
                        key={option.value}
                        option={option}
                        isSelected={value === option.value}
                        onSelect={(currentValue) => {
                            const newValue = currentValue === value ? "" : currentValue;
                            onChange(newValue)
                            setOpen(false)
                        }}
                    />
                ))}
            </CommandGroup>
        </CommandList>
    </Command>
);

export const Combobox: React.FC<ComboboxProps> = ({
    options,
    placeholder,
    emptyMessage,
    className,
    value,
    onChange,
}) => {
    const [open, setOpen] = React.useState(false)

    return (
        <Popover open={open} onOpenChange={setOpen}>
            <PopoverTrigger asChild>
                <Button
                    variant="outline"
                    role="combobox"
                    aria-expanded={open}
                    className={cn("w-[400px] justify-between", className)}
                >
                    {value
                        ? options.find((option) => option.value === value)?.label
                        : placeholder}
                    <ChevronsUpDown className="opacity-50" />
                </Button>
            </PopoverTrigger>
            <PopoverContent className="w-[400px] p-0">
                <ComboboxContent
                    options={options}
                    value={value}
                    setOpen={setOpen}
                    placeholder={placeholder}
                    emptyMessage={emptyMessage}
                    onChange={onChange}
                />
            </PopoverContent>
        </Popover>
    )
}
