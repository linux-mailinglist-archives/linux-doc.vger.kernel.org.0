Return-Path: <linux-doc+bounces-5082-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7E681317E
	for <lists+linux-doc@lfdr.de>; Thu, 14 Dec 2023 14:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 569541F221E0
	for <lists+linux-doc@lfdr.de>; Thu, 14 Dec 2023 13:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC2B56441;
	Thu, 14 Dec 2023 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aUa0IopZ"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A6B193;
	Thu, 14 Dec 2023 05:26:48 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c32df9174so72883495e9.3;
        Thu, 14 Dec 2023 05:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702560406; x=1703165206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OzitBG8c9xTl0gT0hJSz5Dys97zVkHOnQaDrsMAnjGA=;
        b=aUa0IopZJPIlsjAfRWGbYgKh5t7fj14Uu19dA7hLS/RUQDoQYN1U+0dvL034OsaF8Z
         5V3Mt1FMzS1Svma7J6s2x8cUgoTQy0zHCD0cUDpDJntc4RV+DYq5TsT2jOuKGhGS1vsY
         rcspMlP2jCthY+JCPnOC/8mk5oviiIZtt/L9uxBfGTUfPG9MGdV7XnNW2u6DjS9arNYO
         FjX4LQvSsHKtOSy3ftqOWOUWabvRfxzeKY1dm1GA3VddVifXwmGU0RF/CdkEBMJh8DuS
         3bkDwB48kRbEvMoP5bbcpDHh4MOzwMgjH4sQXpI7cVtZ7fxQhHYQrayKPa+HjY9T2GC5
         wmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702560406; x=1703165206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OzitBG8c9xTl0gT0hJSz5Dys97zVkHOnQaDrsMAnjGA=;
        b=R0hH+rhCbvwysIa83uTXUlYrSdf8s6iSEWIrg0piLYaTHzjgMFMW7aLLZurmCodz1n
         pi0lxj8CiMTmcFnFnS8x0APbpbSpE/sqnjAs3JiKwIHMccn62t3qnz4rTjXcY1nITfXL
         9HHgnD1oORIAb9pthsTA1lnIjT6kLzL/uaSL6P6/8TzUg8bJvDvnRJGn28vME2mR25rJ
         6wfW7L9q0J+9I2MD3C7l0WhKLu1/oH7nTKDylh768/RCArySF1hrsKvzBhn5VXPEgalH
         cXPlh+kALmA1Ba+1tJHwwMpY+UpRv3PF0RNE2Wk5kdB/uy9jqaEi4cjw/AlCeGWH/r7t
         qSxQ==
X-Gm-Message-State: AOJu0YyLT6f8nG758hm63UCC7cRW+iuizOYheSOjoWAowynNAzvC525A
	84pWntrDkZ54PhmlOHPWGg==
X-Google-Smtp-Source: AGHT+IEAmnd4phD07IM7T+rbmKBgamrBB7AupBQPikPF+re3a9ZCGWiYw1zYtuoVZyoOVzoio2ny0A==
X-Received: by 2002:a05:600c:4f88:b0:40c:3314:5bdf with SMTP id n8-20020a05600c4f8800b0040c33145bdfmr3870578wmq.230.1702560406435;
        Thu, 14 Dec 2023 05:26:46 -0800 (PST)
Received: from [192.168.1.148] (224.69.114.89.rev.vodafone.pt. [89.114.69.224])
        by smtp.googlemail.com with ESMTPSA id p8-20020a05600c358800b0040b40468c98sm26203703wmq.10.2023.12.14.05.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 05:26:45 -0800 (PST)
Message-ID: <1c03eb18-a6ac-45c8-8fea-46097bb4e132@gmail.com>
Date: Thu, 14 Dec 2023 13:26:43 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] docs: rust: Clarify that 'rustup override' applies to
 build directory
To: Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <e2b943eca92abebbf035447b3569f09a7176c770.1702366951.git.viresh.kumar@linaro.org>
Content-Language: en-GB
From: Tiago Lam <tiagolam@gmail.com>
In-Reply-To: <e2b943eca92abebbf035447b3569f09a7176c770.1702366951.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Level: **

On 12/12/2023 07:43, Viresh Kumar wrote:
> Rustup override is required to be set for the build directory and not
> necessarily the kernel source tree (unless the build directory is its
> subdir).
> 
> Clarify the same in quick-start guide.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org> > ---
> V2:
> - Made few changes based on review comments.
> 
>   Documentation/rust/quick-start.rst | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
> index f382914f4191..7ea931f74e09 100644
> --- a/Documentation/rust/quick-start.rst
> +++ b/Documentation/rust/quick-start.rst
> @@ -33,14 +33,18 @@ A particular version of the Rust compiler is required. Newer versions may or
>   may not work because, for the moment, the kernel depends on some unstable
>   Rust features.
>   
> -If ``rustup`` is being used, enter the checked out source code directory
> -and run::
> +If ``rustup`` is being used, enter the kernel build directory (or use
> +`--path=<build-dir>` argument to the `set` sub-command) and run::
>   
>   	rustup override set $(scripts/min-tool-version.sh rustc)
>   

`scripts/min-tool-version.sh` won't exist within the build dir if the 
option the user takes is "enter the kernel build directory", right? It 
only works if they use the `--path` argument in the `rustup override 
set` option.

I gave this a spin and works as expected, just thought I would mention 
this given how users sometimes simply copy/paste and this may be confusing.

Tiago.

