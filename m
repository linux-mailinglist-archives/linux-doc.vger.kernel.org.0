Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C75D8A228A
	for <lists+linux-doc@lfdr.de>; Thu, 29 Aug 2019 19:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727928AbfH2Rkj (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 29 Aug 2019 13:40:39 -0400
Received: from antares.kleine-koenig.org ([94.130.110.236]:36906 "EHLO
        antares.kleine-koenig.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727483AbfH2Rki (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 13:40:38 -0400
Received: from localhost (localhost [127.0.0.1])
        by antares.kleine-koenig.org (Postfix) with ESMTP id 6862278A3A0;
        Thu, 29 Aug 2019 19:40:35 +0200 (CEST)
Received: from antares.kleine-koenig.org ([127.0.0.1])
        by localhost (antares.kleine-koenig.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id CEpp3c0w2-Ij; Thu, 29 Aug 2019 19:40:33 +0200 (CEST)
Received: from [172.18.85.69] (unknown [46.183.103.8])
        by antares.kleine-koenig.org (Postfix) with ESMTPSA;
        Thu, 29 Aug 2019 19:40:32 +0200 (CEST)
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Juergen Gross <jgross@suse.com>, Petr Mladek <pmladek@suse.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        metux IT consult Enrico Weigelt <lkml@metux.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190827211244.7210-1-uwe@kleine-koenig.org>
 <20190828113216.p2yiha4xyupkbcbs@pathway.suse.cz>
 <74303921-aa95-9962-2254-27e556af54f4@kleine-koenig.org>
 <20190829081249.3zvvsa4ggb5pfozl@pathway.suse.cz>
 <45cd5b50-9854-fce7-5f08-f7660abb8691@suse.com>
 <a83449cf-3a4a-f3e0-210a-dc7c39505355@rasmusvillemoes.dk>
From:   =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
Openpgp: preference=signencrypt
Autocrypt: addr=uwe@kleine-koenig.org; prefer-encrypt=mutual; keydata=
 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
 kC8vBDJg
Subject: Re: [PATCH v2] vsprintf: introduce %dE for error constants
Message-ID: <002dc2a7-40a3-f52a-c8fa-5dbb42e6dd7b@kleine-koenig.org>
Date:   Thu, 29 Aug 2019 19:39:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <a83449cf-3a4a-f3e0-210a-dc7c39505355@rasmusvillemoes.dk>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="LLvAbrEWZxeDGli9lQ0MDXItvivTANWNX"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LLvAbrEWZxeDGli9lQ0MDXItvivTANWNX
Content-Type: multipart/mixed; boundary="MJLe7gzwVY30ZGetLwRlxf7hE96HGZ1Ol";
 protected-headers="v1"
From: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Juergen Gross <jgross@suse.com>, Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 metux IT consult Enrico Weigelt <lkml@metux.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <002dc2a7-40a3-f52a-c8fa-5dbb42e6dd7b@kleine-koenig.org>
Subject: Re: [PATCH v2] vsprintf: introduce %dE for error constants
References: <20190827211244.7210-1-uwe@kleine-koenig.org>
 <20190828113216.p2yiha4xyupkbcbs@pathway.suse.cz>
 <74303921-aa95-9962-2254-27e556af54f4@kleine-koenig.org>
 <20190829081249.3zvvsa4ggb5pfozl@pathway.suse.cz>
 <45cd5b50-9854-fce7-5f08-f7660abb8691@suse.com>
 <a83449cf-3a4a-f3e0-210a-dc7c39505355@rasmusvillemoes.dk>
In-Reply-To: <a83449cf-3a4a-f3e0-210a-dc7c39505355@rasmusvillemoes.dk>

--MJLe7gzwVY30ZGetLwRlxf7hE96HGZ1Ol
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 8/29/19 11:09 AM, Rasmus Villemoes wrote:
> On 29/08/2019 10.27, Juergen Gross wrote:
>> On 29.08.19 10:12, Petr Mladek wrote:
>>> On Wed 2019-08-28 21:18:37, Uwe Kleine-K=C3=B6nig=C2=A0 wrote:
>>>>
>>>> I'd like to postpone the discussion about "how" until we agreed abou=
t
>>>> the "if at all".
>>>
>>> It seems that all people like this feature.
>>
>> Hmm, what about already existing format strings conatining "%dE"?
>>
>> Yes, I could find only one (drivers/staging/speakup/speakup_bns.c), bu=
t
>> nevertheless...
>=20
> Indeed, Uwe still needs to respond to how he wants to handle that. I

This is indeed bad and I didn't expect that. I just took a quick look
and this string is indeed used as sprintf format string.

> still prefer making it %pE, both because it's easier to convert integer=
s
> to ERR_PTRs than having to worry about the type of PTR_ERR() being long=

> and not int, and because alphanumerics after %p have been ignored for a=

> long time (10 years?) whether or not those characters have been
> recognized as a %p extension, so nobody relies on %pE putting an E afte=
r
> the %p output. It also keeps the non-standard extensions in the same
> "namespace", so to speak.
>=20
> Oh, 'E' is taken, well, make it 'e' then.

I like having %pe to print error valued pointers. Then maybe we could
have both %de for ints and %pe for pointers. :-)

Best regards
Uwe




--MJLe7gzwVY30ZGetLwRlxf7hE96HGZ1Ol--

--LLvAbrEWZxeDGli9lQ0MDXItvivTANWNX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl1oDeEACgkQwfwUeK3K
7AlEMwf6AjcdEfSwdAfJdMQQfp3S38QdzIj7grR8T3HDbjMuZ9VzdG3eSotiUqIK
TrO7LVwTktt424dPGdeyAjyLQh2aycJbOVvRIH31ZUmvx+GMVSRHaVuWGRfPjgIX
KXeNZKWkrsNECWEgvnGzYHlQQRd2OFED9j0qCo6WjXWXwHT1Wflw8dzf+PxAuCiL
afGXSEJhvX2Cg4IAQyPTCIoyR0/jl3zJ5JtYm0qNmBd4ZAY2EyDAqB91VRGcbIU4
BJdmXh8tIjmPyG7ZxRPylYVYyoFg90m1e2QKBrbVESz5y8bhsxzlT3tay4pTlTNw
x1zuQm/xcqTomfLo4+GcDMKbyNmFcQ==
=ArVX
-----END PGP SIGNATURE-----

--LLvAbrEWZxeDGli9lQ0MDXItvivTANWNX--
