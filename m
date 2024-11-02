Return-Path: <linux-doc+bounces-29667-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1598E9B9EED
	for <lists+linux-doc@lfdr.de>; Sat,  2 Nov 2024 11:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D9181C20BA7
	for <lists+linux-doc@lfdr.de>; Sat,  2 Nov 2024 10:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 412DE16F0EC;
	Sat,  2 Nov 2024 10:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/6VNM6J"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BEF92E40E;
	Sat,  2 Nov 2024 10:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730543925; cv=none; b=MNUQ9p0fB7atSHC6sehp4qFlJH53sLOFdZWEX/brAUCY1VmNnKM17IwVmAmHaVXa1Hp63j9Lnnf1WFrov7BNHfy34i+/HtJEMlI/2YJBnjoZY35L+0YzbbjwWMBy6LHteX0v40dSetl1NnrwXVX+qEFN41y1S+OPHfgsjzsIal0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730543925; c=relaxed/simple;
	bh=BQwJJ/cANGiQk+8X5Fbd38HuiSZSJSpJGS/bhmW7yBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dmjP3K2JtakRkmHv8qW8UaRrdJ3HhPi6mvH9hp4AKcUffG4XcLt2nDdNoQB+ZsctY2lK9SFKNpfMrPtC0PMPOoxTsyfNV8S1gYHgp7rw9XqJG3T8SPwUNOH1sQC+tcH9bs3Gxsc8ifNzuDG3eCFq4I545FmQxHSPK0uyLUD18ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/6VNM6J; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3e5ffbc6acbso1620662b6e.3;
        Sat, 02 Nov 2024 03:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730543923; x=1731148723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k/ZWk9DDmTrPA9Bmswxbiav7q4dUci0lNhwSdMNy9Po=;
        b=l/6VNM6JlnoE0V4SzhIh84592l/iybCyffynu9Zw2wOrV5PCXp6zX9LGdxC04jjtFe
         8Bo6jxHQamYmP0fOD8zjGWqq9ez8y7QdBbwyyHjCSsckgbETgsrOEnrv6HfqrsN1q8Ih
         pNWIobHt6Jm7hEIU+Y/hzDFCN105365dttCBiZsr0lwXWGUS3nVsnXftKYtZWfHbEBAG
         ORO4ddHiwipKOqMo4f4P7htdblXyWy+OQ1glYsLHTmHYjLfjhpL8mq/dIi6sTei0bmNx
         yOtlzwwEo38QO9TRHdsgMFjDBgTaOAxJPquFRC+cHz72IGeoo36nT2GAqOY3tdUhRFZp
         Q1OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730543923; x=1731148723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/ZWk9DDmTrPA9Bmswxbiav7q4dUci0lNhwSdMNy9Po=;
        b=vGNZVCyWJHZVWYw6hGgKRezbcSJFj5xyeNG9v1Fy7Ulz+G6HtN/n/0SyikEKymHfpU
         pCqDjpFqn88D6gVnWfonVNs6T6dSfAGGRU43IPNsFkrE0NyWRM9OynrjjQM6y9fBDIZm
         3vc3IoBdWhyHWQ+qW0KHC1vmnGvWv/BOV22wi3F3U3bW0q9XTl2TPDDE7a4R8e7cWoFy
         Hf/n73aLFurBWcJj20FSDZxZaGRHRlzImQfl28WjL+A9T2OhW8+Bss9B7iKdcvgAg/xs
         Qkc88FNOXrQzpSxFQ7q1Ph9zfyofgdwbeE76wrrwrI5n/GyrmNymSYyHMJfX7YTrFU2K
         WHfA==
X-Forwarded-Encrypted: i=1; AJvYcCV6jnlWOYtS4huT0pAZsBtvzNghGAnK6q2NT87QWlLSOtkEAAvIhDczz9D1hF5swRyZ1ryk2+lh16A=@vger.kernel.org, AJvYcCVCFgcM4bfFDFCBGWbLjhxOzC4IwqHLPSwvrB3cVgma/G6WQKt/cs9GBBV7qH/fYAmVPKixNYJWBeBXw8xJ@vger.kernel.org, AJvYcCXr5K7X/Xl6CQipfaU7uRUJWteGTX3CkboPmbnGB9uVJp++ycp5Dw+8Bt+bTm2oRssgaV/jmnSiMgci@vger.kernel.org
X-Gm-Message-State: AOJu0YykhS63w2eY/151k73+Ldb6fSl5oewBQBSMQRyZjB44zjIbuuHS
	rVZcb1yC/ahXr5Rb5K8G4guFTTxIB1oJNC1wZHrZv4ShnHtgB7cT
X-Google-Smtp-Source: AGHT+IHrk6/Q5n2E+je2c41WlxltR+FCVn8JFH147Ayi2cb5tVwj+WI6Q57hGT3UkY8Rx4u714ZQ4A==
X-Received: by 2002:a05:6808:2e93:b0:3e7:5b07:6a with SMTP id 5614622812f47-3e75b07017amr5014623b6e.22.1730543922530;
        Sat, 02 Nov 2024 03:38:42 -0700 (PDT)
Received: from illithid ([2600:1700:957d:1d70::49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e66123f363sm1185127b6e.37.2024.11.02.03.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 03:38:41 -0700 (PDT)
Date: Sat, 2 Nov 2024 05:38:39 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-man@vger.kernel.org
Subject: Re: [PATCH v3 4/4] proc_pid_fdinfo.5: Add DRM subsection
Message-ID: <20241102103839.fv3qvp2ltgzzvlr5@illithid>
References: <20241101191156.1272730-1-irogers@google.com>
 <20241101191156.1272730-4-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="554cw2lezzhi6vpu"
Content-Disposition: inline
In-Reply-To: <20241101191156.1272730-4-irogers@google.com>


--554cw2lezzhi6vpu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/4] proc_pid_fdinfo.5: Add DRM subsection
MIME-Version: 1.0

Hi Ian,

At 2024-11-01T12:11:56-0700, Ian Rogers wrote:
[...]
> +.EX
> +pos:    0
> +flags:  02100002
> +mnt_id: 26
> +ino:    284
> +drm-driver:     i915
> +drm-client-id:  39
> +drm-pdev:       0000:00:02.0
> +drm-total-system0:      6044 KiB
> +drm-shared-system0:     0
> +drm-active-system0:     0
> +drm-resident-system0:   6044 KiB
> +drm-purgeable-system0:  1688 KiB
> +drm-total-stolen-system0:       0
> +drm-shared-stolen-system0:      0
> +drm-active-stolen-system0:      0
> +drm-resident-stolen-system0:    0
> +drm-purgeable-stolen-system0:   0
> +drm-engine-render:      346249 ns
> +drm-engine-copy:        0 ns
> +drm-engine-video:       0 ns
> +drm-engine-capacity-video:      2
> +drm-engine-video-enhance:       0 ns
> +.EE
> +.TP
> +.IR drm-driver: " .+  (mandatory)"
> +The name this driver registered.
> +.TP
> +.IR drm-pdev: " <aaaa:bb:cc.d>"
> +For PCI devices this should contain the PCI slot address of the device
> +in question.
> +.TP
> +.IR drm-client-id: " [0-9]+"
> +Unique value relating to the open DRM file descriptor used to
> +distinguish duplicated and shared file descriptors.
> +.P
> +GPUs usually contain multiple execution engines. Each shall be given a
> +stable and unique name (<engine_name>), with possible values
> +documented in the driver specific documentation.
> +.TP
> +.IR drm-engine-<engine_name>: " [0-9]+ ns"
> +GPU engine utilization, time spent busy executing workloads for this cli=
ent.
[...]

In my opinion the use of <bracketed_notation> like that is not idiomatic
in man pages.  (We sometimes see it anyway, because for a long time
"rock star programmers" have treated the neglect of man page idioms as a
competitive sport.[1])

Also the mixture of regex notation with <bracketed_notation> is a little
bewildering (again, my opinion).

I would recast these to use bold for the literal bits, italics for the
variable parts, roman for nonliteral syntax, and, for this page, lean
completely into the use of EREs.

groff_man_style(7) offers suggestions:

   Font style macros
=2E..
              Use bold for literal portions of syntax synopses, for
              command=E2=80=90line options in running text, and for literals
              that are major topics of the subject under discussion; for
              example, this page uses bold for macro, string, and
              register names.  In an .EX/.EE example of interactive I/O
              (such as a shell session), set only user input in bold.
=2E..
              Use italics for file and path names, for environment
              variables, for C data types, for enumeration or
              preprocessor constants in C, for variant (user=E2=80=90
              replaceable) portions of syntax synopses, for the first
              occurrence (only) of a technical concept being introduced,
              for names of journals and of literary works longer than an
              article, and anywhere a parameter requiring replacement by
              the user is encountered.  An exception involves variant
              text in a context already typeset in italics, such as file
              or path names with replaceable components; in such cases,
              follow the convention of mathematical typography: set the
              file or path name in italics as usual but use roman for
              the variant part (see .IR and .RI below), and italics
              again in running roman text when referring to the variant
              material.
=2E..
       Observe what is not prescribed for setting in bold or italics
       above: elements of =E2=80=9Csynopsis language=E2=80=9D such as ellip=
ses and
       brackets around options; proper names and adjectives; titles of
       anything other than major works of literature; identifiers for
       standards documents or technical reports such as CSTR #54,
       RFC 1918, Unicode 13.0, or POSIX.1=E2=80=902017; acronyms; and
       occurrences after the first of a technical term.

So I might write these more like the following.

=2EP
We use extended regular expressions to represent the expected parameter
values;
see
=2EBR regex (7). \" `BR` for Linux man-pages documents only
=2ETP
=2EBR drm\-driver: " .+"\c
=2EI " (mandatory)"
The name this driver registered.
=2ETP
=2EBR drm\-pdev: " [0-9A-F]{4}:[0-9A-F]{2}:[0-9A-F]{2}.[0-9A-F]"
For PCI devices this should contain the PCI slot address of the device
in question.
=2ETP
=2EBR drm\-client\-id: " [0-9]+"
Unique value relating to the open DRM file descriptor used to
distinguish duplicated and shared file descriptors.
=2EP
GPUs usually contain multiple execution engines.
Each shall be given a
stable and unique
=2EIR engine-name ,
with possible values documented in driver-specific documentation.
=2ETP
=2EBI drm\-engine\- engine-name :\c
\& [0-9]+ ns
GPU engine utilization:
time spent busy executing workloads for this client.

I also (1) used the `\c` escape sequence to fit three different font
styles into a paragraph tag; and (2) escaped literal hyphens.

Regards,
Branden

[1] I give you the Worst Man Page in the World.

    https://gitlab.com/procps-ng/procps/blob/7ac9a0e1f5606696dc799b773d5ec7=
0183ca91a3/ps/ps.1

    Fortunately the procps-ng maintainers eventually rewrote it.

--554cw2lezzhi6vpu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmcmAScACgkQ0Z6cfXEm
bc6FyhAArhPCoDcGbr4qZXkTeFtQzbsVWT+LAgQPsbzDSRulHcOyRYqiosrjGVDo
sooTFzFrPusklFvLAeG4KQIeHgPRF9b2HgEXQcbUS2e6fy4p1qa/9bSlsazl1cPw
v99bJgnvKSjVWxLCslb9o0mSGeemiusTwb8ncC4ZVVqjKsLNHlRQ4bQ4+vG4PyeM
jX07pv3yEybOY4yaEvmFj/aBOWbY6CSJCQ+xQYtyYKcJ7ywXHpxh0uqHxsc5EGk9
VRA/0b7VT88E1BeB2TTZtjb9NWRVX49JrZCtJFLllzCOn4+LtwrGL5mWQyLV0BaZ
dWP1QhejnaL/F+UeAmKNdTXIucecvzNlp00iggWYfwxPEJCiFFC7tzgML78ypI77
N7j/NJdluMGivipgQtPIdIAfyEfwq7Qd0P64soJD3lkChX+RbkyNZKhkdQ4ncim5
JfMf/oj0lTMsiTVQrvUge/Ru48yQgPCaa7eT4DhcUN1pTORWKqTFZN/+Z0UZR7au
EL1wSR3pVSHOoqPHh31R/xM+W8fuh6Ri+GTJvz0g8Hy4IaWRYhuGr1XWHGrtoKT8
CBBjYZzKm+Mh+l5ZoccElOaDYAKTXQRSrVRBbyGggM3/H36futr/WgSQycmr05e5
KGZFv6fTvqxpBXFKiWidvr+tLb5w5ls4V1spZSdEbgbpi7/BM4E=
=wUZx
-----END PGP SIGNATURE-----

--554cw2lezzhi6vpu--

