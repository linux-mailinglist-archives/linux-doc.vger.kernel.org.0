Return-Path: <linux-doc+bounces-11286-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D17868707AF
	for <lists+linux-doc@lfdr.de>; Mon,  4 Mar 2024 17:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED0DF1C21AE1
	for <lists+linux-doc@lfdr.de>; Mon,  4 Mar 2024 16:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA064DA05;
	Mon,  4 Mar 2024 16:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oJHNJCZy"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034A55C5F3
	for <linux-doc@vger.kernel.org>; Mon,  4 Mar 2024 16:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709571197; cv=none; b=E/GF5Tgu13ya+dc+XqsN0BpiZtLp8XgGdkmqcBb7JMl34PwNaTiavHU76EgNrAG9Cv60zERAPJFcP1V/EzlauV88DlH4WHkgElqsiNgDC/7vgjyfOHEOfxrI6cQsbbAluaF8cvhHDRGGHaVuSHeJFfEah3bGIw3XMig4mYmGwHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709571197; c=relaxed/simple;
	bh=uirtXHt2GRmTN/MJHpx0AE7MnBAQPCAKYbtW//3AYqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IiGC0WfS/zb/rtuXtSUuwG65LexIopUgldEE+uksHfjd6+H/ZwpkTFhNC9enYwqeYL9yQgBgYeu0KIXh9ZrBtmRvROBwFZjZLEa+NCVwdOH3ubOzZkXTm4XGLJTEryx/1B41s+iO9rPfo7ZsVEBJ1YmoMqDbaaqWVPqEVzHqaHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oJHNJCZy; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-412e80e13abso5149905e9.3
        for <linux-doc@vger.kernel.org>; Mon, 04 Mar 2024 08:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709571194; x=1710175994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmfK1qwaZeZanYojHD0RUbXhDuCbIKpAYEoB7wzNyKE=;
        b=oJHNJCZydzgvwwg0pPpvODiubSxP83AXeOYfrOvYNRX1745RjAPD07MslMP/m9h9bf
         e3eDlVl9yBqdMb56ueaTtMcFXIm6+iauxnmcIbZSo70xHzjrHHcJZoBrHJNMJ/kForqH
         7TwD0b1oxFKSEclLU8+bJEcic3qG/iwr3vCfCVSwpde71J5EFyF/LwtqfR4/P8hqGyCo
         XGxokaKsOuEQ4FpVgFLgDw5Yj9THP2+COyHlHzt1l3i08sMq1+CSWRRxcUtsexcvjJtg
         LIcdGmRXl+GqZXv0Gmz6P1mDaryOOIdIRdRI7zWrREMx6cm6huCsUc7hQObUGD63hDXi
         t7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709571194; x=1710175994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmfK1qwaZeZanYojHD0RUbXhDuCbIKpAYEoB7wzNyKE=;
        b=M/etU8ja1GRp30RNXY+8wL+I+i533/AvKBmXDYOOOsndcikAmKleIXXbXvvnI+KQhE
         P4TyS8fN5bCXHXh25gzPt5RrxGJEuiW1c+18BEGQOq0JnX1U335zXhxWc7nsHkc4LjL6
         NWMPVkI9oe/GDhcoROeFkT4zsrxsin+soQo9FtYn76LSFan3sP4F84shQ48+SKdjpCUO
         ga58o2bVcy2hvcJZjtNt8ImDxn2LVHnvu2h8N72DCNqtudj4PkeUTTRz3CvfYzs9m+1/
         Gecn3ggch1RdLqK5viB9Bx2u7Jt3L29m7ULWzIDRKbS8thf4Yv96AGZuqsLkAY8McKy9
         q4Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVEOr0MdzFVU1D1ezI/cf5IlDkgfxwdicMjXn9U+29f5kwXUtjG2sxWtLO6atWTHI6L9YhKanQcYlT6fziWxbACnUsQZZjTZj1p
X-Gm-Message-State: AOJu0Yz61X8bG3GYCmt3Td9lnxUUW0sC1xPu9yDgWYz1F3xXegX3Dru8
	79lYIzm51uBdrstH6ajAko9hdPEsJi2jxsHnVYzga+QMLZUAWBUgsVE81FiXAkErURxM4PrXf5T
	tK2zK6IO8SwqIbJwbGof0uVXr0myAh0BIISiu
X-Google-Smtp-Source: AGHT+IHO0Vyyj9NTmtrzCpdzXYPsNb82jFuB6Tek6U/mE6kJNdZ0Szp7dN5s8m6Is2RH0XDeJ4uHDoLAJmI7qfo9wFU=
X-Received: by 2002:adf:a441:0:b0:33e:4524:e473 with SMTP id
 e1-20020adfa441000000b0033e4524e473mr993953wra.50.1709571194160; Mon, 04 Mar
 2024 08:53:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301044428.work.411-kees@kernel.org>
In-Reply-To: <20240301044428.work.411-kees@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 4 Mar 2024 08:52:58 -0800
Message-ID: <CAKwvOdkzQCSM1+Z1mRphgu3Vs8SdiDpgxywWiO_OHn+S_Z6UwA@mail.gmail.com>
Subject: Re: [PATCH] compiler.h: Explain how __is_constexpr() works
To: Kees Cook <keescook@chromium.org>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	"Gustavo A . R . Silva" <gustavoars@kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, David Laight <David.Laight@aculab.com>, 
	Martin Uecker <Martin.Uecker@med.uni-goettingen.de>, Jonathan Corbet <corbet@lwn.net>, 
	linux-doc@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 8:44=E2=80=AFPM Kees Cook <keescook@chromium.org> w=
rote:
>
> The __is_constexpr() macro is dark magic. Shed some light on it with
> a comment to explain how and why it works.
>
> Acked-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Is Documentation/kernel-hacking/hacking.rst perhaps a more appropriate
place for this block of text?  Perhaps as another :c:macro: in that
file?

You know I'm not a big fan of increasing header size, even if it is
just a comment.
--=20
Thanks,
~Nick Desaulniers

