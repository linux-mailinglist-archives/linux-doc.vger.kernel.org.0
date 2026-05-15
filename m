Return-Path: <linux-doc+bounces-87606-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHD7Aw3xBmp+pAIAu9opvQ
	(envelope-from <linux-doc+bounces-87606-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 12:10:21 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D992854D141
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 12:10:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B9C93192B40
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 09:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A1B43DA5F;
	Fri, 15 May 2026 09:41:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F1441C2E9
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 09:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778838102; cv=none; b=otVFMJuVZy5/tv+TXfyUOnUB9JgcsAW+blfgQNvJTzhg+5Gz0CM/VT6GHOdKE8pvED0y4i4whwA23GoiGbRPUFTYCRdN7/W8uEaj5SJSiMTDIwVV21fQkO9Bp+zQd8/Bci067WSKIL6qLlvjWec3u1ojeXRtBeMm4N2w8YjyxpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778838102; c=relaxed/simple;
	bh=Wof7AgSd8sIA/vdyBQ5k/kduJ2ZOxVJGQ1EgYiJEMdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oGZnrYKdVyKjiD8U/ngCWLoN0+g+Q09puEjvZUdE12IAtni/795LkkE4H4cBYRtf1SIHEQ2t6mCgAUneIaS/XwSeITefCl+S//Gp6U8iTooXaoFbqvDJTlEqrbVyyu2WHcEQP0YD0MNzrGolZyZUYk4klUqQxNuU//BZcAEvLpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-57533363201so2748717e0c.0
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 02:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778838100; x=1779442900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v5QRWoJ9yDPgCZj1zmcAmkVsMq9UQ41W+/TqEWDopDs=;
        b=jvP58hh5Ia387jSmbi/cSzK6KTIqKstj+8dYuUr1nKiPdAFRUYuauXiU3WjfaoEkWn
         4WdfgxCAflD/+zBkC12UkslM0TpE6GT6vFfNx8VW5FMK/va0BqfXlHWmkgqCD8xUOUbv
         SkfhCOaakwnCk/rDSNa5buS1HOfY72bfkt8vbUjJDTZqL6SfHu1yCjICZ0jGRzkGPX67
         oMG90Yf+dcCIfsPRo42L6xeW6Tih/gqXpCQFSRNeAJjyk8PGR9A8UUSbWBUiRu7UNUc/
         3TVWLncn9EpPC5+/oQliFBkIqKQsorkPes93LmB5LJb39K8gkt6gTSJrJiLxOHRfRoiw
         /vZA==
X-Forwarded-Encrypted: i=1; AFNElJ9MO0Gke/i7J0868B/ATLppqQN6qOGBDAvLUwOLQJ0RSdSGvWxfD4kEFlq5FnmAjJ6Gd3XfqYQQcH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq0O2yYHGzZXHQd4RjxmPuR5XXgWq6Zetyzx/5ShEcjDFg2rci
	Hip5bIHi2fVzgm0WQLDIEuFfIt3RMEDOI1xKOjAjsJWFr9IMXj01oKcFT3inVoli
X-Gm-Gg: Acq92OF/RB2+irXrb+Hv0JdB2kucRhrcBBNyDV1B4SVxAPplDMZf+9wmsdkeT2tjcf+
	M/aKNK3Agotj4Dmky5QZK5Hj++x6QKD8mxlK26TcIV3q7Q4WzkvCcJ2mo8YaJD9wdF2ZPCAWp5+
	gqIKx6GJRiXm4B7WP5W56OVuT00FkAsvOYfJWJqQKe1zbx7BIk+xkoa8LNoIFghWYCkynbrfAVO
	LrMQ09kTP2MBQHFK2viCgkuiL45erXZIUYK3syaAtnRwKupbjgBzhu5kk2yDecuMRfP3NsBx/bV
	sVdg03nErS0Lj5EtSfUvYJtoSRAlrnHMPPJSfSfzIZO8d1IgdIPJf2cQ5IgSAR1tUBJSfnIp8Wr
	pCkyyo2492vwkQJWzYbf1KQkQyJiKaQi58X2EP4kul7UEwrksovqHeOk55aTOAyLYPJfgvRnu5m
	NRqUXBSDddNV7V9Fqa9g88Q3c+xZS9/tcO8vfr00llOYDssDFfcPhIIyegHrha
X-Received: by 2002:a05:6122:3a14:b0:56f:2609:cd95 with SMTP id 71dfb90a1353d-5760c01267emr1643231e0c.9.1778838100395;
        Fri, 15 May 2026 02:41:40 -0700 (PDT)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760fa5bfb6sm932857e0c.10.2026.05.15.02.41.38
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:41:38 -0700 (PDT)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-95cc1a5fe9cso2633830241.2
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 02:41:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9mXTH1deng07JZla/ZRwj6nz1ko9H6DB+gPq+UyRejWV7jAntlSgyM/zcs6Puk/qVhdE/CGFUFzZ0=@vger.kernel.org
X-Received: by 2002:a05:6102:6058:b0:62f:406b:1baf with SMTP id
 ada2fe7eead31-63a3f592865mr1212495137.20.1778838098416; Fri, 15 May 2026
 02:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514163033.108009-2-manuelebner@mailbox.org> <CAMuHMdXFBFbb+3CqaJGRLqUubRm0pt-yYSds0fitm_wv07kYxw@mail.gmail.com>
 <CAHp75VfhHK9E+W83k+w3RWEMq3-HeXC31cJcKE7OiUY9U-wLcQ@mail.gmail.com>
 <CAMuHMdW12mAV2YROUiFLoKKmtNS=tYNZs7pWN0e4wTKkSMA2xQ@mail.gmail.com> <20260515103128.323da7e4@pumpkin>
In-Reply-To: <20260515103128.323da7e4@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 11:41:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWZ-WuD6Sq1BMS5eGm+xLm1Kr+C+AtkXmFjfkhk30SWZQ@mail.gmail.com>
X-Gm-Features: AVHnY4KVvgbTckqXRqXJl8Bd2ZRL_yVxqSUWHvERpCogGm0yfZ4-yEUQ2KLTAjI
Message-ID: <CAMuHMdWZ-WuD6Sq1BMS5eGm+xLm1Kr+C+AtkXmFjfkhk30SWZQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] drivers: add deprecated remarks to strlcat()
To: David Laight <david.laight.linux@gmail.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Manuel Ebner <manuelebner@mailbox.org>, 
	Kees Cook <kees@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Jani Nikula <jani.nikula@intel.com>, 
	Heiko Carstens <hca@linux.ibm.com>, 
	"open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D992854D141
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,mailbox.org,kernel.org,lwn.net,linuxfoundation.org,canonical.com,perches.com,infradead.org,intel.com,linux.ibm.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-87606-lists,linux-doc=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16]
X-Rspamd-Action: no action

Hi David,

On Fri, 15 May 2026 at 11:31, David Laight <david.laight.linux@gmail.com> w=
rote:
> On Fri, 15 May 2026 09:32:06 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, 15 May 2026 at 09:31, Andy Shevchenko <andy.shevchenko@gmail.co=
m> wrote:
> > > On Fri, May 15, 2026 at 10:23=E2=80=AFAM Geert Uytterhoeven
> > > <geert@linux-m68k.org> wrote:
> > > > On Thu, 14 May 2026 at 18:32, Manuel Ebner <manuelebner@mailbox.org=
> wrote:
> > > > > add kernel-doc comment to strlcat() function definitions
> > >
> > > ...
> > >
> > > > > +/**
> > > > > + * strlcat - Append a string to an existing string
> > > > > + *
> > > > > + * @dest: pointer to %NUL-terminated string to append to
> > > > > + * @src: pointer to %NUL-terminated string to append from
> > > > > + * @count: Maximum bytes available in @dest
> > > > > + *
> > > >
> > > > Missing "Returns ...".
> > >
> > > Documentation says "Return:" as
> > > - the section (note important colon)
> > > - the singular (however plural is undocumented and supported)
> >
> > Trailing "s" is not always plural in English ;-)
>
> It is for 'Return' :-)

In case "returns" is a shorthand for "return values", it indeed is ;-)
I meant a conjugation of the verb "to return".

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

