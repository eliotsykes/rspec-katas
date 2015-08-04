# Supervillain School: The Book Befuddler

You're an ambitious pupil of Supervillain School who's not being taken seriously by your classmates. Your fellow evil-doers-in-training don't believe you have what it takes to unleash chaos inside this or any other dimension.

You're going to prove them wrong.

You've been secretly working on a weapon of such unnatural power that if you pull it off your friends and enemies will never look at you, nor their textbooks, in the same way again! MwahahahaHAHA!

Yes, that's right, you've used your evil genius to build The Book Befuddler!

Disguised to look like a harmless laser cannon, your Book Befuddler scrambles the words of any book you fire its wacky word ray at, making the book unreadable...ish

Your ultimate weapon is almost complete. The final task is to program the word-scrambling algorithm.

Whilst laughing maniacally, write a `befuddle(text)` method:

- The `text` parameter is a `String` consisting of one or more sentences
- Return the scambled text from the method (details below)
- Scramble *each* sentence in the `text` parameter in the following way:
  - The 1st word of a sentence must be reversed
  - The 2nd word (if present) of a sentence must be uppercased
  - The 3rd word (if present) of a sentence must have the last character chopped off ("heist" becomes "heis")
  - The 4th word (if present) of a sentence must be capitalized
  - The 5th word (if present) of a sentence must be the length of the word as a digit ("lair" becomes "4")
  - The 6th word (if present) of a sentence must be lowercased
  - The 7th word (if present) of a sentence must be removed completely
  - The 8th word (if present) of a sentence must *not* be changed
- If there are more than 8 words in a sentence, then the sequence of word transforms start again in the same order as given directly above, so:
  - The 9th word (if present) of a sentence must be reversed
  - The 10th word (if present) of a sentence must be uppercased
  - The 11th word (if present) of a sentence must have the last character chopped off
  - and so on...
- Assume sentences are always terminated with a single period `'.'`
- Assume the only punctuation character in the text is standalone periods `'.'` - no other punctuation will appear in the text
- Assume sentences never have whitespace immediately before a period `'.'`
- Return an empty string `''` if the given `text` string is `nil`, empty or only whitespace
- The scrambled text should contain no consecutive whitespace characters. Squeeze consecutive whitespace characters to a single whitespace character `' '`.
- Surrounding whitespace present on the original input `text` should not be present on the returned scrambled text
- The original input `text` object is never modified by the method
- The original input `text` object is never returned from the method

For extra credit, once The Book Befuddler is fully operational, test the weapon on a henchman's textbooks.
