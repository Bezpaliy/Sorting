//
//  StableSortingAlgorithms.m
//  Sorting
//
//  Created by Igor Bezpalyy on 2/22/17.
//  Copyright © 2017 Безпалый Игорь. All rights reserved.
//

#import "StableSortingAlgorithms.h"

#define SWAP(A,B) {(A)=(A)^(B); (B)=(A)^(B); (A)=(A)^(B);}

void testDisplay(int* items, int itemsLength)
{
	for (int i = 0; i < itemsLength; i++) {
		printf(": %d ", items[i] );
	}
	printf("\n");
}

void BubbleSortItems(int* items, int itemsLength, int* countOfItterations, int* countOfSwap, double* sortedTimeInterval)
{
	CFAbsoluteTime currentTime = CFAbsoluteTimeGetCurrent();
//	testDisplay(items,itemsLength);

	for (int i = 0;  i < itemsLength - 1; i++)
	{
		for (int j = 0;  j < itemsLength - i - 1; j++)
		{
//			printf("i = %d : j = %d : a[%d] : b[%d] \n", i,j, items[j], items[j+1]);
			(*countOfItterations)++;
			if (items[j] > items[j+1])
			{
				SWAP(items[j],items[j+1]);
				(*countOfSwap)++;
			}
//			testDisplay(items,itemsLength);
		}
//		printf("-------------------------------\n");
	}
	*sortedTimeInterval = CFAbsoluteTimeGetCurrent() - currentTime;
}

void CocktailSortItems(int* items, int itemsLength, int* countOfItterations, int* countOfSwap, double* sortedTimeInterval)
{
	CFAbsoluteTime currentTime = CFAbsoluteTimeGetCurrent();
	int last = itemsLength-1, left = 1, right = itemsLength-1, j;
	testDisplay(items,itemsLength);
	do
	{
		for(j = right; j >= left; j--)
		{
			(*countOfItterations)++;
//			printf("1: i = %d : j = %d : a[%d] : b[%d] \n", j, last, items[j-1], items[j]);

			if(items[j-1] > items[j])
			{
				SWAP(items[j-1], items[j]);
				last = j;
				(*countOfSwap)++;
			}
			testDisplay(items,itemsLength);
		}
//		printf("1-------------------------------\n");

		left = last + 1;
		
		for(j = left; j <= right; j++)
		{
//			printf("2: i = %d : j = %d : a[%d] : b[%d] \n", j, last, items[j-1], items[j]);
			testDisplay(items,itemsLength);

			(*countOfItterations)++;

			if(items[j-1] > items[j])
			{
				SWAP(items[j-1], items[j]);
				last = j;
				(*countOfSwap)++;
			}
		}
		
		printf("2-------------------------------\n");

		right = last-1;
		
	} while(left < right);

	*sortedTimeInterval = CFAbsoluteTimeGetCurrent() - currentTime;
}
