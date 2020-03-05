Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F03917A20B
	for <lists+linux-doc@lfdr.de>; Thu,  5 Mar 2020 10:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgCEJLU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 5 Mar 2020 04:11:20 -0500
Received: from mout.web.de ([217.72.192.78]:58481 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725877AbgCEJLU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Mar 2020 04:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1583399441;
        bh=Fr9GnI7SbNgdoY+pyMuZol4WTCvWyd/VIo8DXiiVrHw=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=IBJ5dX7zElvEb/xKYmSsxnQpCOktv2VnVU/rj0N90Go3ljO8MRrNPviSF7dzw7GrW
         b+iTzzXYrP9gPCFHuQBQK5ljvBOg+sc3Cyhf/XtxAx7DDX5zD0tQUpZa+HjRjxup8/
         Rp9zqwhkcieARJ0h81I7NaPXTjIMgVAgnO+pr99U=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.48.16.47]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MUncu-1ir4xR2JTw-00Y7QL; Thu, 05
 Mar 2020 10:10:41 +0100
Subject: Re: [v5 0/1] Documentation: bootconfig: Documentation updates
To:     Masami Hiramatsu <mhiramat@kernel.org>, linux-doc@vger.kernel.org
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
References: <158339065180.26602.26457588086834858.stgit@devnote2>
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
Message-ID: <75cea52d-21a4-7c12-baa2-ac7cbd79fed1@web.de>
Date:   Thu, 5 Mar 2020 10:10:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158339065180.26602.26457588086834858.stgit@devnote2>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Provags-ID: V03:K1:odk2cBN/gjqLRg+l6kC9LyeU6nm6e+RWtwQnOKwsl3pI0zuy65y
 bI9QbPNa1DIzzJHjlfKjisNpuhLaDr/2I+VLPOu9uB+HiEAxio4o6pLLxYX9DicYYBDfYmR
 DdLoGmiMt6/eqEEpJEb9w/cfk6XdHmoKsiqI+KG674d/HQVOzWPl4K/9iQbkcgwgfiaqFYA
 3gkDu8Y+3xBeJBZ5yGqNw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ii81T2NKNZA=:wkz4V+PB9nIq+Upt8eEXUv
 d7t7g5QZMOvgMBPTVF58YSItYyPKDYJ53MOCfosN7d9Pg0uG4laQp3EAdtiOkImiPiLH4YcXF
 x3UecNObWLbz46cJIexWEYJBicAD3eMS7EG3QnLnuojSrXftuV+9EwSRWeH2pwOS4pJMlmKri
 jiVFuDxtOW2lEFOmxkPmGCPmLrBtzVkGBir/dZM8pEOnnzgndp5eo2UI5Mzl+hI/J0snPysl8
 OcWmN+0jcGG9qfaPPsw8Bsx2LiADVJBuCzKP9wk3gLMVdxjkOMuUU+BEFm1G8H0AZi4z5NsPw
 vu3Cdjf4FO8CUklzV6NERptybd+l5o51WeqOqDx/j2Fr3j1CcxwzLTdTKjF0Gsk7QJ8R2tIjS
 2E9pSuEGmxh7eM0ZjVsLnkrIQDqhcDQOdUHfYHBv4wDmXp9aM3rAs+Scjcr8A8K9gQS1WdqGQ
 ipdhvq5CCiuPS6fUCA09xZ1jJ4tin00OCAKi+I4WMNJ6+20yvjRTTi8PFl3aUiytUCNLOEteV
 2zQajfXfoO1zWQ3jkxqE8ydXjuKvTy8pOq4cW4fC7lYSPbq2qy+QN5aHRlVT3AqaqMH/rKgNK
 PtxM4zWqCIWs9ZCPpm5v6UsibxHj5kXJ2yPygz/pTmQMpRD7AbX1b0sy/jTeHfpq4SsryqAJ9
 8eExEyxu4ELnJP4Xy+4xSiUGoZSA9ajSAlyYeXmtEseMd4+IRLVXIV5IFc/lTNZVJLui+Dro/
 UnhY9pXozyqrt/UGL61rpI2TtP0UVG9OgoyRkJBe7ITT9RVFoL8yWu7zdi3GVwaE6S/upR4eS
 oF7ffHqD0vTOZu3qz8aLhxEB7zOeQuj+IPvu0wjut8OcnpuEetuPiJWXK4QRBlp7JccxCMQqK
 tFdY6prEwhHf0YAUz8OacCvuEMC0EhC/io+auOfMoXHk5RJqjQM1aOUM2HYuavZKdgZ9jP58c
 mOyRvFo6/S75/uKTro7AZpPD3t0WxRi/hVrWa/WC00AC18RuF6w5tTOke31eakMXeCH487Hpj
 5Vk04ki94F9/HUf0kqKFy4NlHdL2YvVzYRAYFyH38gWPaxImEHhx82R+r487/DN+cChnVZ3HR
 fnxs08tzRk0A2izq9cj5wI6OkiwEGuTJkt5RI3scflnHrcEyXAINHR8oeQL4b8TsqPzwv7/U5
 hs+3wm28tbWY8vyCCU8XkI2lArKB9Jgh5vTJS6FolnTE49W0A0zvJqegt8mRMHDeguo47Jsxy
 Zwi80fBG6KP2VDb1u
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> - Fix some typos.

These changes were incomplete.

Regards,
Markus
