Return-Path: <linux-doc+bounces-29700-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D34B29BA354
	for <lists+linux-doc@lfdr.de>; Sun,  3 Nov 2024 01:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63300281E5A
	for <lists+linux-doc@lfdr.de>; Sun,  3 Nov 2024 00:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB41CBA45;
	Sun,  3 Nov 2024 00:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrtzI77Z"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143A170800;
	Sun,  3 Nov 2024 00:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730595030; cv=none; b=hMmgRj1C+jeNjo8d661kooG7ygRhP9u3O487wFy2OWVUM+Vwa91xZZZ+1jpRS3TZ7RtQvAC2Yj0v1ceAjtKTSg1E3N8Ad/PBZbzrPuUPsk7zQgDA5CoMWEg9pEMpGpDR5Z7GLJ4Yfc5dj76oQIZZWNDRSTYUCghZRQbZZDNH0/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730595030; c=relaxed/simple;
	bh=ioz+Z1Qqu/ArRZY2PFuU+TdKz2vxs2N6G7CkmGHjmhQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOdfHWMsiS8f3+sAlrrNbffVlVfAZQau+R88ixvXFdk6sZL+43xwTbIk7QIVH0sYJETwHf+wO+Sjt95POpjxubESUX41VqfZHtzvTXRv2r437I81ztpSFqV7f4ppFDuFo3J1O7J7MqBvhdqfx8oaj5d1PPXnYZIO85dQw0pA9UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrtzI77Z; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e60fca5350so1773084b6e.2;
        Sat, 02 Nov 2024 17:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730595028; x=1731199828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gETa4NRXmfDcS1JSmNatN62qxFkgRS0pRn/Ce01gIgo=;
        b=QrtzI77Z0K8m8nFQTw4qPCUEm7JY//Lba3+79qApLjxcGD/6FiCTxFbYJy8/uxcKUI
         sOhjo1VSyrE1NlNvffTkUbdWDqkU5ke8oIiaHW5DUveatzeCCUvLv3cIx8QmbnDgevNp
         58QG8Fl82ULydYARnQIt6tbpYeeSKsQgMFjxLgG6itgux3qiVY1lQ1aDZbEs/YlviutO
         jOJn7afmit3eA4zihMY1TK0kWShIhlBq5Ae9XqnhFzYsmskzf3ijM22OOJMblMjp3Ejc
         Nj4r2O9JDhwmM3S3qmi2sq5ImJQdSuJTI98HhVd4tf5/M2B6Ui8gq6+8dP8xgQkCmHA0
         gKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730595028; x=1731199828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gETa4NRXmfDcS1JSmNatN62qxFkgRS0pRn/Ce01gIgo=;
        b=D6oihhpZ/jvq7wqbW0WSsS3uA8zqUSnoBGKJl6lJp+UtBuJqLVqzfnK+VodqGwYt4n
         s/UJBQpOGpZwYBn6BRsmDIx4cPta+6YOrpZ3HBkyeFD+t1CCM77l8TvtnXs2RndInseS
         LY9dCCWJoMYEAm7i4XcFLcAkGWyWWEVtXrdRDY/R7Sn8XhDq/45k478BV2jVcu6JR+Il
         xiPhXZV9l0rBYC9sbGdk/OL3WA57cQezFyMhASMIfnYG+PjC+XorpoCKKphjVkLNu0aj
         ogYD0KlJTHGt3B0CvD+urih7pPuG9VLty8dAJBiuozYg3vThVJpPWZbtgDH4qb7dks6u
         MlFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4yOvWBhypdGmSgnrL2Bd5RfCEp0cr+A2N1cb5XpwKrIyD2WZEtkVfP+zveyzx+WkbjTSMh9oJyjs=@vger.kernel.org, AJvYcCWHkDMA34MeBVsQT8r9txSozbK29J647mCc7NATZMMXt/YCTFa0TKy2VN3SRcJLmm4HC64C0MPWdoAR@vger.kernel.org, AJvYcCWNjuW4Zv5iPZZGBbVMmURAseYJ4r7y7i9noUea6uU9GOaDwavbscCF1XWuguoLD4XSKMvIFfQOl3qrlsNW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/dgod+izTpszcavBjlNHgFWuPFS/XN4LAXvRVetQ47LPW1rNr
	EzCSckPI0Vfkptai9mRhZhqxDhRSYdQVPgE/HAi4Aj9zFDXTJU5r
X-Google-Smtp-Source: AGHT+IEPh0GdbvuTtSpPXltB7GvLpRPbh+YvLPxedLVD85C+IHK61ybrKZu/D32hBhbhshwVklBPiQ==
X-Received: by 2002:a05:6808:3a14:b0:3e6:569e:4601 with SMTP id 5614622812f47-3e6569e4850mr16231090b6e.3.1730595027960;
        Sat, 02 Nov 2024 17:50:27 -0700 (PDT)
Received: from illithid ([2600:1700:957d:1d70::49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e661190b86sm1484666b6e.7.2024.11.02.17.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 17:50:26 -0700 (PDT)
Date: Sat, 2 Nov 2024 19:50:23 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Alejandro Colomar <alx@kernel.org>, Ian Rogers <irogers@google.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <20241103005023.kdv5bkpqkpmsom5g@illithid>
References: <20241015211719.1152862-1-irogers@google.com>
 <20241101132437.ahn7xdgvmqamatce@devuan>
 <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
 <20241101200729.6wgyksuwdtsms3eu@devuan>
 <20241102100837.anfonowxfx4ekn3d@illithid>
 <ZyZ4Tfxfr7M-EqUo@riva.ucam.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7ogur6v43rkrbkek"
Content-Disposition: inline
In-Reply-To: <ZyZ4Tfxfr7M-EqUo@riva.ucam.org>


--7ogur6v43rkrbkek
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
MIME-Version: 1.0

Hi Colin,

At 2024-11-02T19:06:53+0000, Colin Watson wrote:
> How embarrassing.  Could somebody please file a bug on
> https://gitlab.com/man-db/man-db/-/issues to remind me to fix that?

Done; <https://gitlab.com/man-db/man-db/-/issues/46>.

> lexgrog(1) is a useful (if oddly-named, sorry) debugging tool, but if
> you focus on that then you'll end up with a design that's not very
> useful.  What really matters is indexing the whole system's manual
> pages, and mandb(8) does not do that by invoking lexgrog(1) one page
> at a time, but rather by running more or less the same code
> in-process.

Ah, I see it now--"lexgrog.l" is in both the Automake macros
"lexgrog_SOURCES" and "mandb_SOURCES".  Nice and DRY!

> I already know that getting acceptable performance for
> this requires care, as illustrated by one of the NEWS entries for
> man-db 2.10.0:
>=20
>  * Significantly improve `mandb(8)` and `man -K` performance in the
>    common case where pages are of moderate size and compressed using
>    `zlib`: `mandb -c` goes from 344 seconds to 10 seconds on a test
>    system.
>=20
> ... so I'm prepared to bet that forking nroff one page at a time will
> be unacceptably slow.

Probably, but there is little reason to run nroff that way (as of groff
1.23).  It already works well, but I have ideas for further hardening
groff's man(7) and mdoc(7) packages such that they return to a
well-defined state when changing input documents.

> (This also combines with the fact that man-db applies some sandboxing
> when it's calling nroff just in case it might happen that a
> moderately-sized C++ project has less than 100% perfect security when
> doing text processing, which I'm sure everyone agrees would never
> happen.)

Inconceivable, yes!  But fortunately you can run nroff over N documents
and pay its own startup overhead costs as well as those of sandboxing
only once.

> If it were possible to run nroff over a whole batch of pages and get
> output for each of them in one go, then maaaaybe.

That's already true for formatting the entire page.  It's how this was
created.

https://www.gnu.org/software/groff/manual/groff-man-pages.utf8.txt

(...best viewed with "less -R")

With the `-d EXTRACT` feature I have in mind, in its
as-simple-as-possible first-cut form, the problem you anticipate...

> man-db would need a reliable way to associate each line (or sometimes
> multiple lines) of output with each source file,

=2E..would remain.  I'll have to think of a good way to write out
"metadata" (the input file name and the arguments to the `TH` request)
as each page is encountered, and of an interface to enable that.  I
don't see it happening before groff 1.25.

> and of course care would be needed around error handling and so on.

I need to give this thought, too.  What sorts of error scenarios do you
foresee?  GNU troff itself, if it can't open a file to be formatted,
reports an error diagnostic and continues to the next `argv` string
until it reaches the end of input.

> I can see the appeal, in terms of processing the actual language
> rather than a pile of hacks that try to guess what to do with it

=2E..a major selling point, IMO...

> but on the other hand this starts to feel like a much less natural fit
> for the way nroff is run in every other situation, where you're
> processing one document at a time.

This I disagree with.  Or perhaps more precisely, it's another example
of the exception (man(1)) swallowing the rule (nroff/troff).  nroff and
troff were written as Unix filters; they read the standard input stream
(and/or argument list)[1], do some processing, and write to standard
output.[2]

Historically, troff (or one of its preprocessors) was commonly used with
multiple input files to catenate them.

Here's an example of this practice from 1980.

https://minnie.tuhs.org/cgi-bin/utree.pl?file=3D3BSD/usr/doc/pascal/makefile

Regards,
Branden

[1] ...including this option from Seventh Edition Unix (1979) or
    earlier, which survives in GNU troff to this day.

     -i     Read standard input after the input files are
            exhausted.

[2] Seventh Edition troff didn't write to stdout by default, but tried
    to open the typesetter device.  But it had an option to write to
    standard output.

     -t     Direct output to the standard output instead of the
            phototypesetter.

   Running old school Unix under emulation these days, you _have_ to use
   this option to avoid the dreaded "Typesetter busy." diagnostic.

   When Kernighan refactored troff for device-independence, he
   reseated it more squarely in the Unix filter tradition by writing
   its plain-text page description language to stdout.  The output
   driver, such as "dpost" for PostScript, also read its standard input,
   and could thus become just one more stage in a pipeline.  [CSTR #97]

--7ogur6v43rkrbkek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmcmyMgACgkQ0Z6cfXEm
bc4d1Q//fAVUKkgxZ/H/gfe8RxgJvPXHvY1DGuGulrixYK6wk7J9fFL44FhBiiff
jH3L6nLcS1CWto2EbpAoWKikzgq0k+jG5xEon6ZTi6HH05DgxUXti7hOuI5RIn03
3+Eq6U62mf1BX6qntwZhXNUQdXd5aFKJdrqJw6zKhgjkGXYEmqn0Ye5LOCktjzHx
MDuzVqc9NJoOv3sVKt106JxbiQw1Rb5vbW0zYKdpsA5umIFM8QBF/HhJitioAT3n
D+5UsZb/yJ53DbDk+SCHgO5+hjt64E2Y3M7ZF752NexLsIsXPV0vVWUR80R6e793
u7o58x5coSjdzEPgwO0cyYRDfqY+hl93WkoIuSJJoVXEx68ezCbGbBzb0X14S1+k
QDSKYtl1s2f7MhFGInJDdVVpjTAe/UBygOL3ANwjkvTc9b/cXo5ym4Frq2QNeHF6
wSNSvpgLtwkxINBz8NqIzSwfxNvM80kyOabcnf0ISQwTksFA/a3VD+K17hnmyZVv
qTR2aj3diflLFGOQAdHvsuzjMLnWxBn4YHy79CHx8y0c9c/8tKyZJ2OIlmAIV5ua
DOc5U8rxdtpM0Gv7mOQfH3Jb3MZjHtiZERjkJWeZ7zLHmRRCtnUzevyrc0JhGIcL
zv6wvZxObXwgamKGIEmgGdtM14wvNcC9oXP2LlV+d/MRAxVaSEI=
=f/Mx
-----END PGP SIGNATURE-----

--7ogur6v43rkrbkek--

