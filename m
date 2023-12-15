Return-Path: <linux-doc+bounces-5238-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 932698146CA
	for <lists+linux-doc@lfdr.de>; Fri, 15 Dec 2023 12:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44D281F23220
	for <lists+linux-doc@lfdr.de>; Fri, 15 Dec 2023 11:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEBC4250F3;
	Fri, 15 Dec 2023 11:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AcJG9psP"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AB624A14
	for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 11:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d336760e72so4319205ad.3
        for <linux-doc@vger.kernel.org>; Fri, 15 Dec 2023 03:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702639461; x=1703244261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8GgkumGp/FPRWi8vrZgqlN3O931tkPc+89ybT2NhK6s=;
        b=AcJG9psP4sMMUOU8cLZedY3WASC0EQr0JWA39nwMNY3LscqUwG55hwPPTf8vgSyyG8
         wWCH1rKieUrjp15SpwxY9LfB5pkOaA0wWMaLS3ibW7jficCQPJ6eLjBYQn98Zq0rRxET
         p0T/ZIqSjrOg9exOL6pPgjSOcFy36ZjWNdBP9ys6OXlmv2CQ2MraVSV2T1k79iEZqBGg
         xwjcMaHSPO+eY53N2ge+bdon2jBE8JQLb27/fh1ypx4UfzwQWRnW6nYCIz+6Roz5U10h
         C1arWNojkWYYOKGXQOKDDqjWNEhFF6fd0Qxv3Ejwcys+Qbmg5H7Y0lilu9qTZfhUSvTv
         6pCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702639461; x=1703244261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8GgkumGp/FPRWi8vrZgqlN3O931tkPc+89ybT2NhK6s=;
        b=JSH1nz7Ke5C1B4SkKPYP7sk10rPvq3p2PxWsmIH7CBwkxQmLO6Q3rwy380VOWRDO2i
         sDknslCV6IM/XmbfNSyedkvlEUG91k/etnPS1Xi2170NG4HC775G60TqzwF0bNKx7KiN
         zAfFu2zc2qUDEoH7qojYmzPMz1KrGZZFQvG8ZyvkNJ+YogYE3WDTYz0CnyrurUVjUwGw
         W1GS6ka3a8nnbogrr9VC75t2Qasyacg7SLSRnPs0AtIZHyQbx14dGEN31jSfYQja8HCR
         EeFyev4EDcVxnq8dMXNUhNo/SQ8X2tv8+WqTFCTIvrbSxH7Kw2Uckh2dqUIEZJkOIxNE
         2XBA==
X-Gm-Message-State: AOJu0YzD8jxqbOqaOv1MUXkZ74OY2XDBaNHWSRcJ68AKANFcdxWDouhL
	QZ3bqnL8UqVZ6QiUiLe1p3TzJg==
X-Google-Smtp-Source: AGHT+IFEG9bLz2JAciUhtK/pd6aXcCMzmYZ3wFbUvxt15TRzn9C+JcBv3Iuzl2Sww2LzvlF/sW1gxg==
X-Received: by 2002:a17:903:32ce:b0:1d3:6110:32fa with SMTP id i14-20020a17090332ce00b001d3611032famr4422003plr.67.1702639460881;
        Fri, 15 Dec 2023 03:24:20 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id w23-20020a170902a71700b001d0c418174fsm8243159plq.117.2023.12.15.03.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 03:24:20 -0800 (PST)
Date: Fri, 15 Dec 2023 16:54:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tiago Lam <tiagolam@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2] docs: rust: Clarify that 'rustup override' applies to
 build directory
Message-ID: <20231215112418.usky65sibhbiubyx@vireshk-i7>
References: <e2b943eca92abebbf035447b3569f09a7176c770.1702366951.git.viresh.kumar@linaro.org>
 <1c03eb18-a6ac-45c8-8fea-46097bb4e132@gmail.com>
 <CANiq72=mvca8PXoxwzSao+QFbAHDCecSKCDtV+ffd+YgZNFaww@mail.gmail.com>
 <20231215064823.ltm55fk4zclsuuwq@vireshk-i7>
 <a2aca039-7360-476e-a1b1-e950698cd26b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2aca039-7360-476e-a1b1-e950698cd26b@gmail.com>

On 15-12-23, 11:14, Tiago Lam wrote:
> 	If ``rustup`` is being used, enter the checked out source code directory,
> or your build directory (if you're using the `O=` option to build the
> kernel), and run::

I thought people aren't required to enter the build directory now (but
just source code directory) and simply do:

         	make LLVM=1 O=<builddir> rustupoverride

> 
>         	make LLVM=1 rustupoverride

Will this still work if we are in the build directory ?

> 	This will configure your current directory to use the correct version of
> ``rustc`` without affecting your default toolchain.
> 
> 	If you are not using ``rustup``, fetch a standalone installer from:
>      	
> https://forge.rust-lang.org/infra/other-installation-methods.html#standalone

-- 
viresh

