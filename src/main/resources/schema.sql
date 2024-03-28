DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS category;

CREATE TABLE category
(
    id    SERIAL PRIMARY KEY,
    title VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE author
(
    id            SERIAL PRIMARY KEY,
    name          VARCHAR(100) UNIQUE NOT NULL,
    year_of_birth INT                 NOT NULL,
    biography     VARCHAR(1000)       NOT NULL
);

CREATE TABLE users
(
    id       SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100)       NOT NULL,
    email    VARCHAR(50) UNIQUE NOT NULL,
    role     varchar(5)         NOT NULL
);

CREATE TABLE book
(
    id              SERIAL PRIMARY KEY,
    title           VARCHAR(100) UNIQUE               NOT NULL,
    author_id       INT                               NOT NULL,
    category_id     INT                               NOT NULL,
    description     VARCHAR(1500)                     NOT NULL,
    number_of_pages INT CHECK ( number_of_pages > 0 ) NOT NULL,
    year_of_writing INT CHECK ( year_of_writing > 0 ) NOT NULL,
    FOREIGN KEY (author_id) REFERENCES author (id),
    FOREIGN KEY (category_id) REFERENCES category (id)
);

CREATE TABLE wishlist
(
    user_id INT NOT NULL,
    book_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (book_id) REFERENCES book (id)
);

INSERT INTO category(title)
VALUES ('fiction'),
       ('mystery'),
       ('non-fiction'),
       ('memoir'),
       ('literary fiction'),
       ('women''s fiction'),
       ('self-help book'),
       ('children''s literature'),
       ('true crime'),
       ('humor'),
       ('action fiction'),
       ('social science'),
       ('new adult fiction'),
       ('satire'),
       ('bildungsroman'),
       ('crime fiction'),
       ('narrative'),
       ('science fiction'),
       ('historical fantasy'),
       ('genre fiction'),
       ('thriller'),
       ('graphic novel'),
       ('young adult literature'),
       ('essay'),
       ('adventure fiction'),
       ('science'),
       ('contemporary romance'),
       ('magical realism'),
       ('speculative fiction'),
       ('contemporary literature'),
       ('romance'),
       ('detective fiction'),
       ('fan fiction'),
       ('novel'),
       ('historical fiction'),
       ('romance novel'),
       ('short story'),
       ('history'),
       ('biography'),
       ('fantasy'),
       ('fantasy fiction'),
       ('poetry'),
       ('horror fiction'),
       ('autobiography'),
       ('western fiction'),
       ('historical romance'),
       ('cookbook'),
       ('fairy tale'),
       ('travel literature'),
       ('coming-of-age story');

INSERT INTO author(name, year_of_birth, biography)
VALUES ('F. Scott Fitzgerald', 1896,
        'Francis Scott Key Fitzgerald was an American novelist, essayist, and short story ' ||
        'writer. He is best known for his novels depicting the flamboyance and excess of ' ||
        'the Jazz Age—a term he popularized in his short story collection Tales of the Jazz' ||
        ' Age. During his lifetime, he published four novels, four story collections, and' ||
        ' 164 short stories. Although he achieved temporary popular success and fortune in' ||
        ' the 1920s, Fitzgerald received critical acclaim only after his death and is now ' ||
        'widely regarded as one of the greatest American writers of the 20th century.'),
       ('George Orwell', 1903,
        'Eric Arthur Blair was an English novelist, poet, essayist, journalist, and critic who' ||
        ' wrote under the pen name of George Orwell. His work is characterised by lucid prose, ' ||
        'social criticism, opposition to totalitarianism, and support of democratic socialism.'),
       ('Paulo Coelho', 1947,
        'Paulo Coelho de Souza is a Brazilian lyricist and novelist and a member of the Brazilian' ||
        ' Academy of Letters since 2002. His 1988 novel The Alchemist was an international best-seller.'),
       ('Harper Lee', 1926,
        'Nelle Harper Lee was an American novelist whose 1960 novel To Kill a Mockingbird won the 1961 Pulitzer' ||
        ' Prize and became a classic of modern American literature. She assisted her close friend Truman Capote' ||
        ' in his research for the book In Cold Blood (1966). Her second and final novel, Go Set a Watchman, was' ||
        ' an earlier draft of Mockingbird that was published in July 2015 as a sequel.'),
       ('Markus Zusak', 1975,
        'Markus Zusak is an Australian writer. He is best known for The Book Thief and The Messenger,' ||
        ' two novels that became international bestsellers. He won the Margaret A. Edwards Award in 2014.'),
       ('Kristin Hannah', 1960,
        'Kristin Hannah is an American writer. Her most notable works include Winter Garden,' ||
        ' The Nightingale, Firefly Lane, The Great Alone, and The Four Winds.'),
       ('Jane Austen', 1775,
        'Jane Austen was an English novelist known primarily for her six novels, which implicitly interpret, critique,' ||
        ' and comment upon the British landed gentry at the end of the 18th century. Austen''s plots often explore the' ||
        ' dependence of women on marriage for the pursuit of favourable social standing and economic security. Her works' ||
        ' are an implicit critique of the novels of sensibility of the second half of the 18th century and are part of the' ||
        ' transition to 19th-century literary realism. Her deft use of social commentary, realism and biting irony have' ||
        ' earned her acclaim among critics and scholars.'),
       ('Suzanne Collins', 1962,
        'Suzanne Marie Collins is an American author and television writer. She is best known as the author of the young' ||
        ' adult dystopian book series The Hunger Games. She is also the author of the children''s fantasy series' ||
        ' The Underland Chronicles.'),
       ('Ray Bradbury', 1920,
        'Ray Douglas Bradbury was an American author and screenwriter. One of the most celebrated 20th-century American' ||
        ' writers, he worked in a variety of genres, including fantasy, science fiction, horror, mystery, and realistic fiction.'),
       ('Daphne du Maurier', 1907,
        'Dame Daphne du Maurier, Lady Browning, was an English novelist, biographer and playwright. Her parents were' ||
        ' actor-manager Sir Gerald du Maurier and his wife, actress Muriel Beaumont. Her grandfather was George du Maurier,' ||
        ' a writer and cartoonist.'),
       ('Gillian Flynn', 1971,
        'Gillian Schieber Flynn is an American author, screenwriter, and producer. She is known for writing the thriller' ||
        ' and mystery novels Sharp Objects (2006), Dark Places (2009), and Gone Girl (2012), which are all critically ' ||
        'acclaimed. Her books have been published in 40 languages, and according to The Washington Post, as of 2016 Gone' ||
        ' Girl alone has sold more than 15 million copies.'),
       ('Tana French', 1973,
        'Tana French is an American-Irish writer and theatrical actress. She is a longtime resident of Dublin, Ireland.' ||
        ' Her debut novel In the Woods (2007), a psychological mystery, won the Edgar, Anthony, Macavity, and Barry awards' ||
        ' for best first novel. The Independent has referred to her as "the First Lady of Irish Crime".'),
       ('Umberto Eco', 1932,
        'Umberto Eco was an Italian medievalist, philosopher, semiotician, novelist, cultural critic, and political and ' ||
        'social commentator. In English, he is best known for his popular 1980 novel The Name of the Rose, a historical ' ||
        'mystery combining semiotics in fiction with biblical analysis, medieval studies and literary theory, as well as ' ||
        'Foucault''s Pendulum, his 1988 novel which touches on similar themes.'),
       ('Thomas Harris', 1940,
        'William Thomas Harris III is an American writer, best known for a series of suspense novels about his most famous ' ||
        'character, Hannibal Lecter. The majority of his works have been adapted into films and television, most notably ' ||
        'The Silence of the Lambs, which became only the third film in Academy Awards history to sweep the Oscars in all ' ||
        'of the five major categories.'),
       ('Samuel Dashiell Hammett', 1894,
        'Samuel Dashiell Hammett was an American writer of hard-boiled detective novels and short stories. He was also a ' ||
        'screenwriter and political activist. Among the characters he created are Sam Spade (The Maltese Falcon), Nick ' ||
        'and Nora Charles (The Thin Man), The Continental Op (Red Harvest and The Dain Curse) and the comic strip ' ||
        'character Secret Agent X-9.'),
       ('Donna Tartt', 1963,
        'Donna Louise Tartt is an American novelist and essayist. Her novels are The Secret ' ||
        'History (1992), The Little Friend (2002), and The Goldfinch (2013), which has been adapted into a 2019 film of ' ||
        'the same name She was included in Time magazine''s 2014 "100 Most Influential People" list.'),
       ('Liane Moriarty', 1966,
        'Liane Moriarty is an Australian author. She has written nine novels, including the New York Times best sellers ' ||
        'Big Little Lies and Nine Perfect Strangers, which were adapted into television series for HBO and Hulu, respectively.'),
       ('Wilkie Collins', 1824,
        'William Wilkie Collins was an English novelist and playwright known especially for The Woman in White (1859), ' ||
        'a mystery novel and early sensation novel, and for The Moonstone (1868), which established many of the ground ' ||
        'rules of the modern detective novel and is also perhaps the earliest clear example of the police procedural genre.'),
       ('Richard Osman', 1970,
        'Richard Thomas Osman is an English author, television presenter, producer, novelist, and comedian. He is the ' ||
        'creator and former co-presenter of the BBC One television quiz show Pointless. He has presented the BBC Two quiz ' ||
        'shows Two Tribes and Richard Osman''s House of Games and been a team captain on the comedy panel shows Insert ' ||
        'Name Here and The Fake News Show. He has made appearances on British panel shows including Would I Lie To You? and QI.');

INSERT INTO book(title, author_id, category_id, description, number_of_pages, year_of_writing)
VALUES ('The Great Gatsby', 1, 1,
        'The novel was inspired by a youthful romance Fitzgerald had with socialite Ginevra ' ||
        'King, and the riotous parties he attended on Long Island''s North Shore in 1922. ' ||
        'Following a move to the French Riviera, Fitzgerald completed a rough draft of the ' ||
        'novel in 1924. He submitted it to editor Maxwell Perkins, who persuaded Fitzgerald ' ||
        'to revise the work over the following winter. After making revisions, Fitzgerald ' ||
        'was satisfied with the text, but remained ambivalent about the book''s title and ' ||
        'considered several alternatives. Painter Francis Cugat''s dust jacket art greatly ' ||
        'impressed Fitzgerald, and he incorporated its imagery into the novel.', 190, 1925),
       ('Nineteen Eighty-Four', 2, 1,
        'The story takes place in an imagined future in an unspecified year believed to ' ||
        'be 1984, when much of the world is in perpetual war. Great Britain, now known as ' ||
        'Airstrip One, has become a province of the totalitarian superstate Oceania, which ' ||
        'is led by Big Brother, a dictatorial leader supported by an intense cult of ' ||
        'personality manufactured by the Party''s Thought Police. The Party engages in ' ||
        'omnipresent government surveillance and, through the Ministry of Truth, historical ' ||
        'negationism and constant propaganda to persecute individuality and independent thinking.', 328, 1949),
       ('The Alchemist', 3, 1,
        'The Alchemist (Portuguese: O Alquimista) is a novel by Brazilian author Paulo Coelho ' ||
        'which was first published in 1988. Originally written in Portuguese, it became a widely ' ||
        'translated international bestseller. The story follows the shepherd boy Santiago in his ' ||
        'journey across North Africa to the pyramids of Egypt after he dreams of finding a treasure there.', 180, 1988),
       ('To Kill a Mockingbird', 4, 1,
        'As a Southern Gothic novel and Bildungsroman, the primary themes of To Kill a ' ||
        'Mockingbird involve racial injustice and the destruction of innocence. Scholars ' ||
        'have noted that Lee also addresses issues of class, courage, compassion, and gender ' ||
        'roles in the Deep South. Lessons from the book emphasize tolerance and decry prejudice. ' ||
        'Despite its themes, To Kill a Mockingbird has been subject to campaigns for ' ||
        'removal from public classrooms, often challenged for its use of racial epithets. ' ||
        'In 2006, British librarians ranked the book ahead of the Bible as one "every adult ' ||
        'should read before they die".', 281, 1960),
       ('The Book Thief', 5, 1,
        'The Book Thief is a historical fiction novel by the Australian author Markus Zusak, set ' ||
        'in Nazi Germany during World War II. Published in 2006, The Book Thief became an international ' ||
        'bestseller and was translated into 63 languages and sold 17 million copies. It was adapted ' ||
        'into the 2013 feature film, The Book Thief.

        The novel follows the adventures of a young girl, Liesel Meminger. Narrated by Death, the novel presents the ' ||
        'lives and viewpoints of the many victims of the ongoing war. Themes throughout the story include death, ' ||
        'literature, and love.[1]', 584, 2006),
       ('The Women: A Novel', 6, 1,
        'Women can be heroes. When twenty-year-old nursing student Frances “Frankie” McGrath ' ||
        'hears these words, it is a revelation. Raised in the sun-drenched, idyllic world of ' ||
        'Southern California and sheltered by her conservative parents, she has always prided ' ||
        'herself on doing the right thing. But in 1965, the world is changing, and she suddenly ' ||
        'dares to imagine a different future for herself. When her brother ships out to serve ' ||
        'in Vietnam, she joins the Army Nurse Corps and follows his path.', 480, 2024),
       ('Pride and Prejudice', 7, 1,
        'Few have failed to be charmed by the witty and independent spirit of Elizabeth ' ||
        'Bennet in Austen’s beloved classic Pride and Prejudice. When Elizabeth Bennet first ' ||
        'meets eligible bachelor Fitzwilliam Darcy, she thinks him arrogant and conceited; he ' ||
        'is indifferent to her good looks and lively mind. When she later discovers that Darcy ' ||
        'has involved himself in the troubled relationship between his friend Bingley and her ' ||
        'beloved sister Jane, she is determined to dislike him more than ever. In the sparkling ' ||
        'comedy of manners that follows, Jane Austen shows us the folly of judging by first ' ||
        'impressions and superbly evokes the friendships, gossip and snobberies of provincial ' ||
        'middle-class life. This Penguin Classics edition, based on Austen''s first edition, ' ||
        'contains the original Penguin Classics introduction by Tony Tanner and an updated ' ||
        'introduction and notes by Viven Jones.', 404, 1813),
       ('The Hunger Games', 8, 1,
        'In the ruins of a place once known as North America lies the nation of Panem, a shining ' ||
        'Capitol surrounded by twelve outlying districts. Long ago the districts waged war on the ' ||
        'Capitol and were defeated. As part of the surrender terms, each district agreed to send ' ||
        'one boy and one girl to appear in an annual televised event called, "The Hunger Games," ' ||
        'a fight to the death on live TV. Sixteen-year-old Katniss Everdeen, who lives alone with ' ||
        'her mother and younger sister, regards it as a death sentence when she is forced to ' ||
        'represent her district in the Games. The terrain, rules, and level of audience participation ' ||
        'may change but one thing is constant: kill or be killed.', 384, 2008),
       ('Animal Farm', 2, 1,
        'A farm is taken over by its overworked, mistreated animals. With flaming idealism and stirring ' ||
        'slogans, they set out to create a paradise of progress, justice, and equality. Thus the stage ' ||
        'is set for one of the most telling satiric fables ever penned –a razor-edged fairy tale for ' ||
        'grown-ups that records the evolution from revolution against tyranny to a totalitarianism just ' ||
        'as terrible. When Animal Farm was first published, Stalinist Russia was seen as its target. ' ||
        'Today it is devastatingly clear that wherever and whenever freedom is attacked, under whatever ' ||
        'banner, the cutting clarity and savage comedy of George Orwell’s masterpiece have a meaning ' ||
        'and message still ferociously fresh.', 97, 1945),
       ('Fahrenheit 451', 9, 1,
        'Guy Montag is a fireman. His job is to destroy the most illegal of commodities, the ' ||
        'printed book, along with the houses in which they are hidden. Montag never questions the ' ||
        'destruction and ruin his actions produce, returning each day to his bland life and wife, ' ||
        'Mildred, who spends all day with her television “family.” But when he meets an eccentric ' ||
        'young neighbor, Clarisse, who introduces him to a past where people didn’t live in fear and ' ||
        'to a present where one sees the world through the ideas in books instead of the mindless chatter ' ||
        'of television, Montag begins to question everything he has ever known.', 249, 1953),
       ('Rebecca', 10, 2,
        'The novel begins in Monte Carlo, where our heroine is swept off her feet by the dashing widower ' ||
        'Maxim de Winter and his sudden proposal of marriage. Orphaned and working as a lady''s maid, she ' ||
        'can barely believe her luck. It is only when they arrive at his massive country estate that she ' ||
        'realizes how large a shadow his late wife will cast over their lives--presenting her with a ' ||
        'lingering evil that threatens to destroy their marriage from beyond the grave.
        "Daphne du Maurier created a scale by which modern women can measure their feelings." --Stephen King', 449,
        1938),
       ('Gone Girl', 11, 2,
        'On a warm summer morning in North Carthage, Missouri, it is Nick and Amy Dunne’s fifth ' ||
        'wedding anniversary. Presents are being wrapped and reservations are being made when Nick’s ' ||
        'clever and beautiful wife disappears. Husband-of-the-Year Nick isn’t doing himself any favors ' ||
        'with cringe-worthy daydreams about the slope and shape of his wife’s head, but passages from ' ||
        'Amy''s diary reveal the alpha-girl perfectionist could have put anyone dangerously on edge. ' ||
        'Under mounting pressure from the police and the media—as well as Amy’s fiercely doting parents—the ' ||
        'town golden boy parades an endless series of lies, deceits, and inappropriate behavior. Nick ' ||
        'is oddly evasive, and he’s definitely bitter—but is he really a killer?', 432, 2012),
       ('In the Woods', 12, 2,
        'As dusk approaches a small Dublin suburb in the summer of 1984, mothers begin to call ' ||
        'their children home. But on this warm evening, three children do not return from the dark ' ||
        'and silent woods. When the police arrive, they find only one of the children gripping a tree ' ||
        'trunk in terror, wearing blood-filled sneakers, and unable to recall a single detail of the previous hours.

        Twenty years later, the found boy, Rob Ryan, is a detective on the Dublin Murder Squad and keeps his past a secret. ' ||
        'But when a twelve-year-old girl is found murdered in the same woods, he and Detective Cassie Maddox—his partner ' ||
        'and closest friend—find themselves investigating a case chillingly similar to the previous unsolved mystery. ' ||
        'Now, with only snippets of long-buried memories to guide him, Ryan has the chance to uncover both the mystery ' ||
        'of the case before him and that of his own shadowy past.

        Richly atmospheric and stunning in its complexity, In the Woods is utterly convincing and surprising to the end.',
        496, 2007),
       ('The Name of the Rose', 13, 2,
        'The year is 1327. Benedictines in a wealthy Italian abbey are suspected of heresy, ' ||
        'and Brother William of Baskerville arrives to investigate. When his delicate mission ' ||
        'is suddenly overshadowed by seven bizarre deaths, Brother William turns detective. His ' ||
        'tools are the logic of Aristotle, the theology of Aquinas, the empirical insights of Roger ' ||
        'Bacon — all sharpened to a glistening edge by wry humor and a ferocious curiosity. He ' ||
        'collects evidence, deciphers secret symbols and coded manuscripts, and digs into the eerie ' ||
        'labyrinth of the abbey, where “the most interesting things happen at night.”', 592, 1980),
       ('The Silence of the Lambs', 14, 2,
        ' A young F.B.I. cadet must receive the help of an incarcerated and manipulative ' ||
        'cannibal killer to help catch another serial killer, a madman who skins his victims.', 338, 1988),
       ('The Maltese Falcon', 15, 2,
        'Detective Sam Spade is a private eye with his own solitary code of ethics. When his ' ||
        'partner is killed during a stakeout, he is drawn into the hunt for a fantastic treasure ' ||
        'with a dubious provenance—a golden bird encrusted with jewels. Also on the trail are a ' ||
        'perfumed grifter named Joel Cairo, an oversized adventurer named Gutman, and Spade’s new ' ||
        'client Brigid O’Shaughnessy, a beautiful and treacherous woman whose loyalties shift at ' ||
        'the drop of a dime. ', 217, 1941),
       ('The Secret History', 16, 2,
        'Under the influence of a charismatic classics professor, a group of clever, eccentric ' ||
        'misfits at a New England college discover a way of thought and life a world away from ' ||
        'their banal contemporaries. But their search for the transcendent leads them down a ' ||
        'dangerous path, beyond human constructs of morality.', 576, 1992),
       ('Big Little Lies', 17, 2, 'Sometimes it’s the little lies that turn out to be the most lethal.

        A murder…A tragic accident…Or just parents behaving badly? What’s indisputable is that someone is dead.

        Madeline is a force to be reckoned with. She’s funny, biting, and passionate; she remembers everything and ' ||
                                  'forgives no one. Celeste is the kind of beautiful woman who makes the world stop and stare but ' ||
                                  'she is paying a price for the illusion of perfection. New to town, single mom Jane is so ' ||
                                  'young that another mother mistakes her for a nanny. She comes with a mysterious past and a ' ||
                                  'sadness beyond her years. These three women are at different crossroads, but they will all ' ||
                                  'wind up in the same shocking place.

        Big Little Lies is a brilliant take on ex-husbands and second wives, mothers and daughters, schoolyard scandal, ' ||
                                  'and the dangerous little lies we tell ourselves just to survive.',
        512, 2014),
       ('The Woman in White', 18, 2,
        'Woman in White by W Collins. With an Introduction and Notes by Scott Brewster, University ' ||
        'of Central Lancashire Wilkie Collins is a master of mystery, and The Woman in White is his ' ||
        'first excursion into the genre. When the hero, Walter Hartright, on a moonlit night in north ' ||
        'London, encounters a solitary, terrified and beautiful woman dressed in white, he feels impelled ' ||
        'to solve the mystery of her distress. The intricate plot is peopled with a finely characterised cast, ' ||
        'from the peevish invalid Mr Fairlie to the corpulent villain Count Fosco and the enigmatic woman ' ||
        'herself.', 528, 1860),
       ('The Thursday Murder Club', 19, 2,
        'In a peaceful retirement village, four unlikely friends meet up once a week to ' ||
        'investigate unsolved murders.

        But when a brutal killing takes place on their very doorstep, the Thursday Murder Club find themselves in the middle of ' ||
        'their first live case. Elizabeth, Joyce, Ibrahim and Ron might be pushing eighty but ' ||
        'they still have a few tricks up their sleeves.

    Can our unorthodox but brilliant gang catch the killer before it''s too late?', 382, 2020);