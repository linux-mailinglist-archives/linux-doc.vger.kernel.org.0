Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC46317C535
	for <lists+linux-doc@lfdr.de>; Fri,  6 Mar 2020 19:15:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727069AbgCFSPn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 6 Mar 2020 13:15:43 -0500
Received: from mout.web.de ([212.227.17.12]:53021 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726788AbgCFSPm (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 6 Mar 2020 13:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1583518497;
        bh=arTwW/yzMdP6EGktVinihPskdpxfqPE2AVoTTm23dSA=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=XD8325B8EY0gb5r4qnsUxQ75L/FTDBjHjUerYaBb0NBrOhvrffi3SBW2M78Qg+2pv
         ejtR0NoCKpz8yMf7e8add5Yagx5bia1nF+iHO+HmPFQMrUhrHO4uaSY4DABvTpDaAr
         taUNiSsY+SbtNnnzswNoV/s0JDixkmxomcwAcwT4=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.156.79]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M0yiR-1jUqYZ3IVT-00v9r9; Fri, 06
 Mar 2020 19:14:56 +0100
Subject: Re: [v5.1] Documentation: bootconfig: Update boot configuration
 documentation
To:     Masami Hiramatsu <mhiramat@kernel.org>, linux-doc@vger.kernel.org
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <ef820445-25c5-a312-57d4-25ff3b4d08cf@infradead.org>
 <158341540688.4236.11231142256496896074.stgit@devnote2>
 <f3c51b0a-2a55-6523-96e2-4f9ef0635d9f@web.de>
 <20200306105107.afba066a97db1eb12f290aff@kernel.org>
 <58f4d6b3-ce3d-d1a5-aa0f-c31c1bbec091@web.de>
 <20200306230406.dd9c7358f00f47ff5760c899@kernel.org>
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <8870b794-4ca2-9dc4-e45e-66de2ff64e4b@web.de>
Date:   Fri, 6 Mar 2020 19:14:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200306230406.dd9c7358f00f47ff5760c899@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:0nG73Pu6y38inQIKocuNjboD/6r6Ts7jA7mUVdnGKTTWWV3B4uN
 1PNM5zUNSTi+ssvO8/xHrsrO90VFD0RIwKNk4o+mruAgiqylfG5M25zJDkirs4Fd77dgtPo
 NTVikYHxl/E1eBlbYYvbXnhZntaorJgxzHSUhFsYvlESAJj1v4CbgxEwyHn9a71VYWMeI9c
 rnPt4FVoo+WFoFTf+vrbQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bw41LnNJy4w=:nLVQ/mRfeH5LwMDHWRk7Sa
 OYOABOwcnLJmCnkf8QDfGj+h2OqiW5p0gCXYPyrvsK3z2ZgzIORpMBdmrmq4hfWKipuPdsw1a
 ykPpvIXh9FGnNmTB5Gya+dbaSH1ZRIcJcux0YNW+0pLiUHQZWV36U4WUVA8R67cOEQNNwQKIv
 u0ZM6/3fyR/y3PVYhxGKypqUsZ94NIDTeKMPUVLRMrb43y/1W08c6dLyNCoMmd6sFcgK1nMLX
 LuGS3ZiyNBqNwcfrioxgWCYm8IuinBMq0ynMUQY1MGNk0AhG6wYJiUzBVIhZX22qOAyA36XcA
 /a9v830XCYGnXmoxaYXwxMYPJnC6WkV3JwbQxWFVuKiRapdVOr2Z6Ik+y3BufSyquoli5mgkE
 TBqX4hLCvR9VhsiytoK3lbvBG9Q/q8vYzalp+fMalGxFXVz34gp3WIW4xkJjFMd1mtDHLkKQk
 PihwsArc56O/hM9E58FJtvJud45l6s/F2m347F5wTaIlXsQEj3VKgk4MaHfPgmTRdapmj1gq8
 VWXRkXRsjSh+d2A3fffLPp7zlFsHyypaE/eXyvOwA/GvsoGmS9kdty4xDbiSAeZ17QgTKCPpL
 RKFAViUfXg8PNglgrIeCj81eLcNIhD9RKKdR+Htiod7XEqnDg0/ModwGyaL+wU7GXGHh6q2ep
 hS15Pzr+vy9CQTBVv+nqkjQmFv/yt6Izh8VFR+K1ebBgCoAlV6O429HYLMc1QSfxlOycIYeva
 3Sgi3fAv/kRqBZDIyM3W9tHEmnQ9UHApC/NR5lMuB4DVn7uXW8ZsXwfXldBszXKmAns1hhWJt
 hQZ2W4+ZAHaY4kuzHVc2CrJMB7899M/aAhRIuvT2tLgaPzVBJKti5CWzUtK/uM+EGxrQ0Uokk
 bjFJE91fYIArFzQ9+ucabEB7zW5x3gxMdQH+zlGVEDe/Uzp0B8/z3uk7Gla9cOTPt8+Hh+twq
 uE8X19wBy9cPJ/VwdKNwIsJygRzMrHeavbyJ2n3Zdrsub7xd6B69lbbQ7jjYH19iv7oUGDjgo
 I7q5w+SP0WTxEdBSuiOsItOTdP9lZE203QEGzoEnsngYhX4UeZAyAX/bdU4muB2OXrlDiMwBd
 OfSksXt2TzmwxYRANtHjgXX38s//4HPH6t17aizjHf3IYfheF0+BffRSQxcbxJ8WdMY9vTGWY
 5bFmjqQKg9e7DcTUMR/MK7mhLeLmfYq3uSoCslL6hX41czibLboENanvIbyhEuiTS+rynqMZV
 76KBvoFT9rurpB7cX
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

>> I got the impression that we are in the process of constructing another=
 patch together
>> which will fix known wording weaknesses.
>
> Would you mean the broken EBNF part?

I hope that such software design approaches can also be reconsidered.


> Yeah, maybe, but it is another story.

Other concrete update suggestions are probably easier to integrate before.
Which change opportunities will be picked up next?

Regards,
Markus
