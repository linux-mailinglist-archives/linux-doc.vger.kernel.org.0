Return-Path: <linux-doc+bounces-42372-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A7AA7E3CE
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 17:17:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 271B31885DD5
	for <lists+linux-doc@lfdr.de>; Mon,  7 Apr 2025 15:09:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FD81F3D53;
	Mon,  7 Apr 2025 15:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="I+1Lg9hf"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553BB1F4299
	for <linux-doc@vger.kernel.org>; Mon,  7 Apr 2025 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744038571; cv=none; b=sEoXCY73Hdciu1Z7lARRvRGnCyG+gwKBkBUlRvUD93V24nz9I4+UXLyuOWjyWF9J+691oHLJkcWvZPCxNCFVNp827j9quuTikmGh823/Y4LgtUVBjhXS47mw0M6T2rd+L7JLM7qQw/+1NvyuMj/PW9GBFojgWb1mtcaHD/cvJW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744038571; c=relaxed/simple;
	bh=QFbdEg3bdlWihK/atjI8KG/ClwBZaCMNkaOsxbUVO+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QVT2LETAKd4X4hCzV02NKeHg/9KlICRH0MCxEvaU92F01pVElMLpaFIcOOv3VoYtZrqITZafR9kwF0o9jCC3C3HZN4pR5AzZhBHKEqbz0JW1nAuqP5L5mFGU5zscFZbeY59SP9rHt9MSemRrXs1qmAkilUNmkrRs6f+5amY6KYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=I+1Lg9hf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so18428845e9.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Apr 2025 08:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744038567; x=1744643367; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bmsPW/IuCIMhHuegXao26Op7RdiU2z6+4rii+HhvEQg=;
        b=I+1Lg9hfWBw12c27jKDKxe8T8gp+B2cGHFG/o0bCIvffuVNXj6/A8PwBlYD0pdkat6
         3Bpixa+esmZ2xR0IQ/zFFrcEjM/vApTI4Z3+DSr+YUhLYdpXga2D7U76qAfnCPMmdr48
         37NVsWMM/ORr4VOvj+oqM8/4vKlw5qO4VxJviQxlVj//DnGdsZ3Y64SD1bxxd/NLImRX
         9H1pKivyrIZ+5tAcViaPxM7PjesJ3+c4GcIb6saAkW/RGAPsuDMLsWQdvAodiCQLgIFO
         Lavu7L7nuNUNpDd0Yb1VBK0DcoETjqJvAKuKv+WVYwlu5Ci3JWSwKO2yAUFa386lQY+Y
         ZtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744038567; x=1744643367;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmsPW/IuCIMhHuegXao26Op7RdiU2z6+4rii+HhvEQg=;
        b=V4woIsRSHPvnXK8OL5MAV1ilXJui5ElJ8SpitvhxuMZ8t5svUvjIRyegzan94zb/Ha
         tzxXkBMVks79lk5HeVFxrI2A2n1Rn9Kqx/D9xZQEksxbvOrtFjF68X1+XauLaNRJwDpk
         OEg/jaZAcPAeMePZyQKHkdKMFa+Lx7jpSI7P+/sikSBZgR5tsOQEdbfwzRT0nZ2c1IEq
         +hMUbz7+6nbN3JjhS3Bz3u3jldiCBlVlqaXtnsAR8wDyNJZy2KKLUAAa5ffUM1sHW8J5
         4cz1p/KR6l7h6CndQK663T/qtvLIxzv3IAfUAU8H2tUW+t94hbYPeKf3hk2AFdFNFD35
         Fubg==
X-Forwarded-Encrypted: i=1; AJvYcCWGTUJddfcTdcaObSQq2OBGP2/XLB/lrcql4e3aQlrfHFR3ePJI6tIa0Sn32PFgC67ErJohu2XGG7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRBXOuHAhwEz/tzDEnUVSe/d4LjIohDLNp8y2RjED5wTXGTgqH
	Yhtds7FZwFjYjNdILqGYsmSm475NOVmbk+8PvFy6k8CkSwa1zHNn5Vn/XPW77UI=
X-Gm-Gg: ASbGnctQ/Xn5YkdzSUwFIz4whkyXfsunDjQy1a2yqL15uRm/i2d/d9ey5D6e69WSE3r
	UTiiuvTsa97bKrj1aUnvPSbqBTHIy0TC7G1KcgKSR1CoslXB3niUpcYeeGlU6l4gR2uriT3D9rs
	6168etEv8cvRootWVyIqRWMHOvRwlRRWYcmgb35LSspHF7Ch2lewXa1gTK1Vjt+XRGPQjaT5iUu
	u/WZu8suUleLE7qVMiWI+4Jyce6SSyLpRi09hQI6BklCBDsjZxZy2QLYOwKtRola2VXjmCPxUhp
	C5inwlo4UIzWh6Hg38ITOtCHY0pgNLA7qFoyFuHHx6YaMV0=
X-Google-Smtp-Source: AGHT+IFKtcPtXIriIebz2GLDNpcyLtI8/d7dTMWyJquEPgAhC6jN+Ozp3zBNOoKwt9alXNTrbKHNiA==
X-Received: by 2002:a05:600c:4fc6:b0:43b:cd0d:9466 with SMTP id 5b1f17b1804b1-43ecf86ab8cmr107340865e9.9.1744038567238;
        Mon, 07 Apr 2025 08:09:27 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1660bcesm135136305e9.10.2025.04.07.08.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 08:09:26 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:09:24 +0200
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: alyssa@rosenzweig.io,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com,
	joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
	Kees Cook <kees@kernel.org>, tamird@gmail.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v3 2/3] printf: add tests for generic FourCCs
Message-ID: <Z_PqpEDTC0RPiPez@pathway.suse.cz>
References: <8153cb02-d8f1-4e59-b2d5-0dfdde7a832e@live.com>
 <PN3PR01MB9597E8833F0DCE0C7C360135B8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959799C9C343A7F08E04158BB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB959799C9C343A7F08E04158BB8AA2@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Mon 2025-04-07 19:12:39, Aditya Garg wrote:
> 
> 
> On 07/04/25 7:07 pm, Aditya Garg wrote:
> > From: Aditya Garg <gargaditya08@live.com>
> > 
> > This patch adds support for kunit tests of generic 32-bit FourCCs added to
> > vsprintf.
> > 
> > Acked-by: Tamir Duberstein <tamird@gmail.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Aditya Garg <gargaditya08@live.com>
> > ---
> 
> Petr are you fine with this here?

Yes, looks good:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr


