Return-Path: <linux-doc+bounces-12135-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8901087C0DA
	for <lists+linux-doc@lfdr.de>; Thu, 14 Mar 2024 17:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C333C1F229C5
	for <lists+linux-doc@lfdr.de>; Thu, 14 Mar 2024 16:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFA473189;
	Thu, 14 Mar 2024 16:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="iB+Rgdmu"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A69DDD9
	for <linux-doc@vger.kernel.org>; Thu, 14 Mar 2024 16:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710432100; cv=none; b=kMAUStzqwvegsLzyFil9byVTTbDk5OAWnHsDPYRJMcdYeUjlosQK4QQPxEEoW/v19UUI7g1n8FNsG2+TRpZxLcGA/V/dVQIoBAC/LeESk5JtZ7LNAKgbwrq8NX9QjZ5Lgku1bx22xiWZND74Isz37yujR5oclKPPyWv9tk8K/GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710432100; c=relaxed/simple;
	bh=RPt4+zH2JGF+EQbBemfUY1fFy2ECcpkCY7CdtLIo/gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m1fPAasKgnp9mFcmEzqoN7j8Wp13tt4wPvmbXFYijry792v2Ceg0T166cGqCKXhI9oTPV2S2f2YV06JE/L+AAs2f8uMyuyBJ37A+DsIl9ZHnebq9rwO27H74qohs4KOAiYsKnWCT9C+I5K+NSUMGN4d0MXAHspt/D1qIURslz+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=iB+Rgdmu; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d2fad80eacso12411771fa.2
        for <linux-doc@vger.kernel.org>; Thu, 14 Mar 2024 09:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710432096; x=1711036896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SWbhk0M0pYWBHQl3jcidlFtgqCoVtSmo505/PkDGLks=;
        b=iB+RgdmusRcaaWa89pdZ8RbXBeneYh68jhpim4sofBZ1dNEhEJc05WM5A+9JuqEQG6
         2VZqeXM+FMOCfm9mdj1dordackLd1ex51Hhp4MORF+U+6xjXn4IvriDRLQFA91BBmqgb
         MSb7mZmeSgjvyhmwLQ2h4xgWDKKXrxd4pcJpf4j9E9OX6VzDgUk3BOMo+V9JEF4DgsOj
         a4etfjZSU6/8CFGNPHUUx2Yq8rYUGkiPNKEb5tSUur6YVryHH9DwJgV/TmjQ50ANycHA
         zfz8CW2sPaJRBf/6L/jmDbghGQby1IWKenuxEhDJVXPsSqHyuanZKr1or2QCfHOcVrLw
         khGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710432096; x=1711036896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SWbhk0M0pYWBHQl3jcidlFtgqCoVtSmo505/PkDGLks=;
        b=PmAdWm809MwxUPZHcxa4bQdox9mIPMuEA4QqKY9fjXAsOoqimHsNqOpYvkqkLY3s2M
         cCuJnJEOh2I4l9QrkD70qNV2BmNu27c+7/nmk3zJz1Frx9de4vlQuxHZHbUzZBnuCaay
         GIsj9e405RTlug9LkP7HYtkpBElnKsas417N7CzxZvNizbk3GrD8/ebhou0IQQyyQG9Q
         NgsQK2VS1tS3QETVD+H9382yj/brM7aJ+3MVHSCv46Kdr20ArW3uqzrZrupgwl0QddQV
         RypsjS4N8OltFBvq/RIV/p9b1UBOt+9VexBO7m5/QbgQ+YqmzqCTK/X9DSlBD16sHYJd
         s+VA==
X-Forwarded-Encrypted: i=1; AJvYcCW1bo6btin6IHrzJTZDj9JvFzr+jylo0+OHlQgzqo3rTiw7hcPCANgX9amsiZi+2ksXhB3b0zZQWltdAMyky0FU79TjRwjUIxa6
X-Gm-Message-State: AOJu0YzD2V1yEO/wJDiMtslACYISi3VgarLo5xCFNS/VwNMGfL26CVZo
	wXT9j8EsicKKaeJVV116ehaQ5BR7hdOlk3HLvI4HTWbNVvOwWgAqVn2MpQJdmzJcREYLjlEsA3k
	Zc6iOu9fZaVnmbL3BQWbufyX4WAL8VER+H5mZiA==
X-Google-Smtp-Source: AGHT+IEyq1ilSmMVhlLgmMvok/MgHLDNgW8a3rQIuFJO8NMfn5EU+p/B9+opU5f+fV9w+Lk1GgVZpjla9tTF+2MHU6A=
X-Received: by 2002:a2e:9f42:0:b0:2d4:6d56:4aa9 with SMTP id
 v2-20020a2e9f42000000b002d46d564aa9mr345474ljk.33.1710432096009; Thu, 14 Mar
 2024 09:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313-mainline-ad7944-doc-v1-0-7860416726e4@baylibre.com>
 <20240313-mainline-ad7944-doc-v1-2-7860416726e4@baylibre.com>
 <CAMknhBEaG9SLqi2HEjOYi3mnyOx=6uAQjaw1=sZqErevKBJTEg@mail.gmail.com> <20240314155720.0e38636f@jic23-huawei>
In-Reply-To: <20240314155720.0e38636f@jic23-huawei>
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 14 Mar 2024 11:01:25 -0500
Message-ID: <CAMknhBFuNUMoHq-SWHmm00H_kAfkSDUzzm2i-mCbzDXt=yDgKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs: iio: new docs for ad7944 driver
To: Jonathan Cameron <jic23@kernel.org>
Cc: Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I missed the reply-all on my last reply, so adding back this lists for
the record.

On Thu, Mar 14, 2024 at 10:57=E2=80=AFAM Jonathan Cameron <jic23@kernel.org=
> wrote:
>
> On Thu, 14 Mar 2024 10:52:57 -0500
> David Lechner <dlechner@baylibre.com> wrote:
>
> > On Wed, Mar 13, 2024 at 3:28=E2=80=AFPM David Lechner <dlechner@baylibr=
e.com> wrote:
> >
> > ...
> >
> > > +AD7944 and AD7985 are pseudo-differential ADCs and have the followin=
g attributes:
> > > +
> > > ++---------------------------------------+---------------------------=
-----------------------------------+
> > > +| Attribute                             | Description               =
                                   |
> > > ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D+
> > > +| ``in_voltage0_raw``                   | Raw ADC voltage value (*IN=
+* referenced to ground sense).    |
> > > ++---------------------------------------+---------------------------=
-----------------------------------+
> > > +| ``in_voltage0_scale``                 | Scale factor to convert ra=
w value to mV.                     |
> > > ++---------------------------------------+---------------------------=
-----------------------------------+
> > > +
> >
> > A colleague pointed out that it is perhaps a bit unusual to have
> > per-channel scaling since the scale is determined by a single
> > reference voltage. I guess it is OK here since there is only one
> > channel. But the driver hasn't hit mainline yet, so we could change
> > that if you think it is better to have a "shared" `in_voltage_scale`.
> Lots of devices have per channel scaling (amplifiers on the front end) bu=
t
> on a single channel device, it could be shared or per channel without
> it making any practical difference.
>
> It's unusual, but not wrong, so I'm not that fussed either way.
>
> >
> > ...
> >
> > > +
> > > +Show voltage input channel values:
> > > +
> > > +.. code-block:: console
> > > +
> > > +    root:/sys/bus/iio/devices/iio:device0# cat voltage0-voltage1_raw
> > > +    -101976
> > > +    root:/sys/bus/iio/devices/iio:device0# cat voltage0-voltage1_sca=
le
> > > +    0.038146972
> > > +
> >
> > Typo here. Missing `in_` on the attribute name.
>

