Return-Path: <linux-doc+bounces-4490-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C84E80987E
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 02:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD387B20D7F
	for <lists+linux-doc@lfdr.de>; Fri,  8 Dec 2023 01:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6312ED0;
	Fri,  8 Dec 2023 01:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvAywlk1"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0A81706;
	Thu,  7 Dec 2023 17:14:33 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7b70de199f6so8031639f.2;
        Thu, 07 Dec 2023 17:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701998073; x=1702602873; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo7cHeMTarcGBUaA8OM2fMUJyq8/LpYExJLjCHdh5Nc=;
        b=EvAywlk11vAybVFoYb2/hKS8i9IqpVgXPH78bIQgRsYD4jynVOG0tG61jeRqsWNhDp
         XVOW7H2bZ1CJF9BKR6twI5O7/pfJ4EWdBdfTC8Lswenfr7osbAPPF5S2bftsUSoE1k7r
         Pna4vAPsb5dZnrgEsbFTLayXjODFd5V3aN5J8j/WOKi8iveno7NJguPwjWse9LnQ/DOo
         7httFtKl+MV0bXCSyH22xHCeyKDGkExxweDyTMvRP7uz7S0n9ASgJ/PLIii0i2IwNjUM
         i5yfUIWQoCGV9a0jhq75Tl3mEBgKcbTpjxyO9UqODg9F9FaFmYGckRYj68CPkWJoSEcz
         rhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701998073; x=1702602873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yo7cHeMTarcGBUaA8OM2fMUJyq8/LpYExJLjCHdh5Nc=;
        b=CXf8e4gOklRcu7ffjJelqPfv0TZ6FH87VzpQN1ZLntCe/eqcOv/KuVQrnvjv07LxUc
         kOu3YRxtSXMaBs6mY05kJBof1Wga6Gc9KmMI1K2FP6Avl+PL0gEoWWikVTgLhv09FT0A
         ipZ3FKBXamCPwqAUgYYv2igY7p6ssc1G9pL6yXen10Y0OuLchetdXpUQtQQzBxjFWVat
         AUOZzUEwbpBM3jR5yrq5VVSB6xPVxSzU8H4WJ9SZgmnhTmR1vD+3Dz17uoJprhvF1mTL
         UoFIdSK3TYRkU6Izl2MtoUYvcFlCJxm5JgoyJQwkmhUPqyKJ6tOdfLlXWZw77ifG29Vb
         SlDA==
X-Gm-Message-State: AOJu0YzsZnKwwUutlNmSooHbgRCiWvmvltu9tsB/o3OYur0A7rQw7FXF
	5R1/gNz8QDZ8PNSluyFRbVcp2ybYnuRwoZAz1Cs=
X-Google-Smtp-Source: AGHT+IGbjmLNlRtCGSEhodbGWN+yzNI4TT0/HC0YbFZhYWMfP1qxatOgxAM6aeeJ3rqqfImLhOJqQviiHaz3CA0yUJo=
X-Received: by 2002:a5d:8194:0:b0:7b3:973d:c4 with SMTP id u20-20020a5d8194000000b007b3973d00c4mr4073115ion.16.1701998073117;
 Thu, 07 Dec 2023 17:14:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231207192406.3809579-1-nphamcs@gmail.com> <20231207141142.307745be167d044b0eec1b42@linux-foundation.org>
 <CAKEwX=Oa4hKCvhhR7D9kbQ-gi2LaKBjeC3GNB3b91doVB07vEA@mail.gmail.com>
In-Reply-To: <CAKEwX=Oa4hKCvhhR7D9kbQ-gi2LaKBjeC3GNB3b91doVB07vEA@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 7 Dec 2023 17:14:22 -0800
Message-ID: <CAKEwX=O7uovg611oyXFKTJdQ3y+Fi42RAXVheT904RcDOXwtjg@mail.gmail.com>
Subject: Re: [PATCH v6] zswap: memcontrol: implement zswap writeback disabling
To: Andrew Morton <akpm@linux-foundation.org>
Cc: tj@kernel.org, lizefan.x@bytedance.com, hannes@cmpxchg.org, 
	cerasuolodomenico@gmail.com, yosryahmed@google.com, sjenning@redhat.com, 
	ddstreet@ieee.org, vitaly.wool@konsulko.com, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeelb@google.com, muchun.song@linux.dev, 
	hughd@google.com, corbet@lwn.net, konrad.wilk@oracle.com, 
	senozhatsky@chromium.org, rppt@kernel.org, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	david@ixit.cz, chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 4:42=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> wrote:
>
[..]
>
> I don't have any concrete numbers though - any numbers I can pull out
> are from highly artificial tasks that only serve to test the
> correctness aspect of the implementation. zswap.writeback disablement
> would of course be faster in these situations (up to 33%!!!!) - but
> that's basically just saying HDD is slow. Which is not very
> informative or surprising, so I did not include it in the changelog.

For instance, on a server with HDD, I allocate memories and populate
them with random values (so that zswap store will always fail), and
specify memory.high low enough to trigger reclaim. The time it takes
to allocate the memories and just read through it a couple of times
(doing silly things like computing the values' average etc.):

zswap.writeback disabled:
real 0m30.537s
user 0m23.687s
sys 0m6.637s
0 pages swapped in
0 pages swapped out

zswap.writeback enabled:
real 0m45.061s
user 0m24.310s
sys 0m8.892s
712686 pages swapped in
461093 pages swapped out

(the last two lines are from vmstat -s).

