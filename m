Return-Path: <linux-doc+bounces-826-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 101617D38C8
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 16:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE338281307
	for <lists+linux-doc@lfdr.de>; Mon, 23 Oct 2023 14:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EEF1B26F;
	Mon, 23 Oct 2023 14:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="28jjL3dG"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB051B26B
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 14:02:53 +0000 (UTC)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB35310C3
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 07:02:48 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c9d140fcddso22645895ad.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 07:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698069768; x=1698674568; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rhW2ovogLAtdgY5SQJlkyUio4XiA8u6f7LVxFg6+xTw=;
        b=28jjL3dGmwdSUNGHPq9r6/PNDV2Zq8+g86rWh5kEdvzsDIjYDps+VbW8/Tp5T49rMy
         1vnL8QahM4PD4Og8ZeOHLxN73p3StEGHBQ0Ecwr+U7Bx9LtQNJTwdQmwD/i7VdXKTaP2
         5CSu1nOUYprg6GS1eyhXmdNlREK28ToDzDiOlqQ8yBWKPsVFzp+2mruCTVMrtXMYD6rv
         KEu0oGRC74EblJPRSHobwUgqdUjrJiwQc/dro6kUOygetsA4n5R7cqh1B+YsD1q8LAnE
         sl25Ggz0P1oNujddlAQZlCXW4QxZC4tU9Jd1w2p8z+QfLuRbtyeid9is/hICq/mdY54O
         VZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698069768; x=1698674568;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rhW2ovogLAtdgY5SQJlkyUio4XiA8u6f7LVxFg6+xTw=;
        b=mgGh8edNWoa7Xl6banj/p6XE7fwW+vbUvHWHIhYTg0VRY6E8+rEBuADZEXRQmbaEJY
         Ud/+k40FkNK9vgkcULT3HWc4qVP3pVWxCLJGkqSs3n0mCzvPFN5BdvWBa4nl4b71+IyL
         uZDbMkvo/HNasMNjS4AsAcrmzj11R1HDoVBq63CzxV3Y3/OYn7kGly29SvekraLKXYAN
         68VilqjbBglKBRbKQWjnbFPOw/zMTAOE7GVw6gFIQ4vXlaFvGhEo1z0Z6O8aaE9+SZmc
         1ytK1Upzz95228RFMAoIzSTe8o0ddzKqD4NSYPZ7cZD3R7+ERe18me9KSLXQf0ysEaWO
         G8AQ==
X-Gm-Message-State: AOJu0YznItKGlnpVMyL2OKMQA5ZS09b3mqm6a/wh3Qwyy7EkByqk2FnT
	WoIXSBA4v8Vo9aDVRzCD3LQV+u7/SRg=
X-Google-Smtp-Source: AGHT+IGUuvbhHZfz3wZFORlHNhRdI0cdjVmY0n57bSPikZhKGOb7nYXCvw6ZXfanc1szj32IaalJvX01dDI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ab5a:b0:1c7:3462:ce8d with SMTP id
 ij26-20020a170902ab5a00b001c73462ce8dmr169614plb.10.1698069768169; Mon, 23
 Oct 2023 07:02:48 -0700 (PDT)
Date: Mon, 23 Oct 2023 07:02:46 -0700
In-Reply-To: <20231023102846.14830-1-przemyslaw.kitszel@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231023102846.14830-1-przemyslaw.kitszel@intel.com>
Message-ID: <ZTZ9Bk3-NrK_cVDu@google.com>
Subject: Re: [PATCH] checkpatch: allow tags between co-developed-by and their sign-off
From: Sean Christopherson <seanjc@google.com>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Jacob Keller <jacob.e.keller@intel.com>, 
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Content-Type: text/plain; charset="us-ascii"

+Mateusz

On Mon, Oct 23, 2023, Przemek Kitszel wrote:
> Additional tags between Co-developed-by and corresponding Signed-off-by
> could include Reviewed-by tags collected by Submitter, which is also
> a Co-developer, but should sign-off at the very end of tags provided by
> the Submitter.

...

> Mateusz Polchlopek <mateusz.polchlopek@intel.com> has reported this to me.

Heh, there's a tag for that...

  Reported-by: Mateusz Polchlopek <mateusz.polchlopek@intel.com>

And it's usually a good idea to Cc the reporter in case there are questions they
can help answer.

> @@ -509,16 +509,18 @@ Example of a patch submitted by the From: author::
>  	Signed-off-by: Second Co-Author <second@coauthor.example.org>
>  	Signed-off-by: From Author <from@author.example.org>
>  
> -Example of a patch submitted by a Co-developed-by: author::
> +Example of a patch submitted by a Co-developed-by: author, who also collected
> +a Reviewed-by: tag posted for earlier version::
>  
>  	From: From Author <from@author.example.org>
>  
>  	<changelog>
>  
>  	Co-developed-by: Random Co-Author <random@coauthor.example.org>
>  	Signed-off-by: Random Co-Author <random@coauthor.example.org>
>  	Signed-off-by: From Author <from@author.example.org>
>  	Co-developed-by: Submitting Co-Author <sub@coauthor.example.org>
> +	Reviewed-by: Some Reviewer <srev@another.example.org>
>  	Signed-off-by: Submitting Co-Author <sub@coauthor.example.org>

This is silly.  Allowing tags in-between Co-developed-by with Signed-off-by
unnecessarily complicates things, e.g. people already miss/forget the rule about
tightly coupling Co-developed-by with Signed-off-by.

And if we're being super pedantic about chronological history, arguably the
Reviewed-by should come before the Co-developed-by as adding the Reviewed-by is
a (trivial) modification to the patch that was done by the submitter.

