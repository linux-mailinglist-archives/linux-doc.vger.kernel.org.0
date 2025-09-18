Return-Path: <linux-doc+bounces-58744-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF95B42D55
	for <lists+linux-doc@lfdr.de>; Thu,  4 Sep 2025 01:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA8A84863E7
	for <lists+linux-doc@lfdr.de>; Wed,  3 Sep 2025 23:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D7F2DA758;
	Wed,  3 Sep 2025 23:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+jiA0C2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C37D2D8798
	for <linux-doc@vger.kernel.org>; Wed,  3 Sep 2025 23:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756941877; cv=none; b=HZiRSyEqN7TDO6L2D193YjVHMKDBYEV4eOmQnjgV8jWZCo0C+TMc9jHdm9e9P/qYEck2htgQkMHXVmwxJmEpOjGkp5L8/wGfwpSmYWgTAaLVbLb2e6J6d88ZXTyqcX38tpUv6DKOGG823+ISuiApbTgh66sKYOiF2DArN5svfSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756941877; c=relaxed/simple;
	bh=B4MQg+tVyIEQBtbxab9btlYwylfbuT9p5w33UynSFSg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WT+lOJU+EeeHGWe7dizqlV60Gk0jkqTrPinimJkWoCV2rFTavJf2Tl/Xc4WTp9SA3L48hwcbYcjM4DsSnWES7k8szEirrrtUHbT7OrAIfvQEgIWZf/1d+8z2fzK5Nat6hlX1P25lcCDiQuAig7RdVUOjJ8uNOxzskjYBtErZhlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+jiA0C2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24aacdf40a2so951735ad.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Sep 2025 16:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756941875; x=1757546675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4MQg+tVyIEQBtbxab9btlYwylfbuT9p5w33UynSFSg=;
        b=V+jiA0C2RjwX8ScbZNta7MynuzYXFGc2IIfE+usbgarS91pSVBEJjZWLAeVk1RrdAj
         ur/LCGIFpsBfC1rfQjwn2i9r6ecWVTdN5Kt626i5RQtOiL+hY+I7VuejshT7xFZF72Lq
         +/W6J54km3q7LNcdISOp/AApKmCrAnXUbCfhKIT0as3sq53s7pQzQZjNpfNIXVg7x9cZ
         Xb5rB+XPg32cojUEkc0C2d3i1h5e0HRy3IEGB85i42laQjBfr7Gm8xJxB5Hif6HuKGee
         WLNDnSL7f9dtJvn239arbuM9EX8lJUBbIu3RnoMLhmsEIT/ohek7CnMe+Hpg8XnKuFnY
         JLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756941875; x=1757546675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4MQg+tVyIEQBtbxab9btlYwylfbuT9p5w33UynSFSg=;
        b=vIroWZ39hXZf8gIzzDQ80sa/55D//e0OzlzikhJ9u+/U2MRbwaBRsWMO4QjdTPtbQB
         YxQ7nDEu9oTX9M81ZqoxgAsMgL1UONJqx2WvxJKDfo8Bu5z6MBahivILF98gC8e+YCCx
         hn83e7JpKa8jy2yZJFFjRUf3LE3R7e95xCWXb56jaGBW2iXbTC3EjKVYDDq0p8g27hRt
         0Tsn5QwrW+qRAw4lA/LktriD8mG51ar3Y/yaPm8ZeNrVzowRZdWJfOmX/NwB5SROMQ1k
         IpsmUGxKMGEcakVMM8H/B10xlxGdUupDA2o6xVlv7t3+w994qY/1D9yAQbJh2d5AWpD5
         CTCw==
X-Forwarded-Encrypted: i=1; AJvYcCX6vwxk7SZurm5nacruOc3SQCDjzRZngtH3qN/ClZeE75goQTmIB2U/pNUWcYjH2oFZazSxEuc/cCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA/8k4K050Fu3KUaSgrcUhs9/vBb5C2YiKAS0o9WSv7BtJl18i
	vij7zswnqhN9OqzRaqbbVBspmK1fmtaouSmKOt9oq9JJdV1Fi3i2f8s9l64c16EN2ML/xJhYyfZ
	wnD0WpNmQV19JnKo70WqRL+tqElcy9MM=
X-Gm-Gg: ASbGncskQLA8pTVkyIpF4MetUJYlN6OS8SV68E4HQvYtViXi3FTEAWOKDAJ+NWoVTL/
	TuWnivctPqpX1L3932CYUix0jbEBlDtwHFGAs/l/vlB3L3PjaDtci+aqopob0X+SF8ScFHS7SaW
	hUCSJDCXbL0uEcvw5Wu508HBtyvkATcTKzD1PnRavyXNBIKe44Z26lgsAl8dLanwnBuuRwMhtfQ
	lWrMIfiG6vsEp5ObyD8GOypQx1cr1ObyPcEFsd1JQ7iz3e4/34MLf5H1BwbeMpTp7fBzHdIBIt2
	dnB1vnN0pJWnQVNrNBWTl6GlbxThRDIEgonW
X-Google-Smtp-Source: AGHT+IEjlWFuPMxhtD/Mq7OZwOStvmczamQHMaG5FsSJXT9epadmoDRef8lNJ29rsmcfdJHBWLObAXkHao0s90DS5wU=
X-Received: by 2002:a17:903:1a70:b0:248:847b:8906 with SMTP id
 d9443c01a7336-2491098b4c3mr158698905ad.11.1756941875488; Wed, 03 Sep 2025
 16:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830-cheesy-prone-ee5fae406c22@spud> <20250903190806.2604757-1-SpriteOvO@gmail.com>
In-Reply-To: <20250903190806.2604757-1-SpriteOvO@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Sep 2025 01:24:22 +0200
X-Gm-Features: Ac12FXx5iwHLbaJ0TZ88p_k42OqHbK3bT3Fq9WvwJC3yuhfgjLr0qE6Io-xqWpQ
Message-ID: <CANiq72nRA9zHbzroLPa9aNSEzKre=V8Jwmw2Lezy6AHgbm+FcA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: get the version of libclang used by bindgen in
 a separate script
To: Asuna Yang <spriteovo@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Jason Montleon <jmontleo@redhat.com>, 
	Han Gao <rabenda.cn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>, Jeff Xu <jeffxu@chromium.org>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Shakeel Butt <shakeel.butt@linux.dev>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Christian Brauner <brauner@kernel.org>, Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 9:08=E2=80=AFPM Asuna Yang <spriteovo@gmail.com> wro=
te:
>
> Decouple the code for getting the version of libclang used by Rust
> bindgen from rust_is_available.sh into a separate script so that we can
> define a symbol for the version in Kconfig that will be used for
> checking in subsequent patches.

Hmm... I am not sure it is a good idea to move that into another
script. Do we really need to intertwine these two scripts? The rename
isn't great either.

Cc'ing the rust-for-linux list too.

Thanks!

Cheers,
Miguel

