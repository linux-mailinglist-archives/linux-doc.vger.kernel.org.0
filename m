Return-Path: <linux-doc+bounces-10997-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4AE86B0B7
	for <lists+linux-doc@lfdr.de>; Wed, 28 Feb 2024 14:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E3EF1F26DE7
	for <lists+linux-doc@lfdr.de>; Wed, 28 Feb 2024 13:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C74214D44A;
	Wed, 28 Feb 2024 13:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KtY7nQTM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D119014D452
	for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 13:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709128017; cv=none; b=KEAYBpNmXGDTDF885kqIn0R7xWKCP2C1wU5PMYJXI/sLtfStasUn284yNvfSbSybEqrokA5Ff9RFuLAEQjxwG+jaB3YLXwIPgYFcdZGckZzUNYoF0hmPOay9RJqTE7sArZ1vR2oLCDqzbCxBqqx3G3iyqIMaEalOTD+l8pxDbAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709128017; c=relaxed/simple;
	bh=ymHrqDk7VWzL+X4vUhdrura4R4GWKkZNuZaV7hmNw2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DzR7S2ycnhWleTq3vSoI/ZN/7nt4G/nIOV9GFDRk5lMITqWtv/uUTV6AZ9lFA2ZTrrYrvP03Bx75NwCYeNzrEhrMOLGKDyTo3OwPm+o0275X9Yh3mXwqIzuTIBExVguQUrEzcfmhtC2qaZFop1SZpTbGGJU8E2YJNQChVHmGs3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KtY7nQTM; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-412a9f272f4so74105e9.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 05:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709128014; x=1709732814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymHrqDk7VWzL+X4vUhdrura4R4GWKkZNuZaV7hmNw2c=;
        b=KtY7nQTMZxeR7j4kTDdTEmi0nsBci+s3Ji8uufm1eHtjPNapqRCsRdOhpYAZ8bvoqy
         f9Ee8ba29vkRD5wgC1VSgDP75rEMCPokRqs3SbmOCRw+hNHLgBeBwAEhJGpRVCfFt19C
         1Fud7A1SV5z6KHZIfI0Fj03SHKtJIKKw+Cz7YJ5s2+FU1VKVzk7iyNUSdax9hv+bMD8e
         AsGEDM9X/LrUu9Be0JqLx06IcnvyRAvJM5fu0sUvYLngFxT6n990nmeQztIuZv5IbS4K
         yvJvJDNlSRzhTL5wHbmLwO9lHqqopaEFdCfsqYzjHIxjTtNDx2evDDLI94tfu8z+xnnP
         Pzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709128014; x=1709732814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymHrqDk7VWzL+X4vUhdrura4R4GWKkZNuZaV7hmNw2c=;
        b=fXQ66gpr6G8tWtXgZDMW5cqyrR+dTtFG0+xzcjnRArkBJpX+zwbnmbW/tIyV/5NZOs
         aRJQcSoOPsTPOYK6sJaGjZ7atzFBY5l0yioyReENXZtKfteK9WqwxXiRbkJymmz3SXHa
         6HNMaNHDOxkcdrAU6TTxuXf+wDjyIBxaj9pDQvlRlXARmjU1ZKkebWRMJzT3bKcYvCx0
         aT8/HlQof21xw9uINm+yU2BOpHG4oloSf/fdALJQH7vtDWR7PfbOJwvCy6XwmKB91LRk
         hMiYVYJcuy06ExOO2Meg2DGHiGQlAqVQdcsAaqQfFqAkAYuzOwx21kyt8dDT/aW4Nlg1
         p0Uw==
X-Forwarded-Encrypted: i=1; AJvYcCWihMiLQ1iycqs/lUEUOxqrFPYKmfSZXbgRcLI6R8oogujzhEReUezJSJXFrMZcj/yJiRZSLATbqz+d6E+33lgyRfSpcIhsRA6a
X-Gm-Message-State: AOJu0YzpR5HLB81yiiMefH+tQQ8eM6Ud1f4VgUbcxAXolli5fC3DDUTh
	BMGdhVFHchvIq4OC1muUmjlOVHS0sHoDbdO3yQNPzqKflqn5RQAuijktYDW02hE5Hsl9ej6Vn57
	7BDTYorFVA8JUm7SKemivsH/Rn8hV1gUlh0wc
X-Google-Smtp-Source: AGHT+IHbeTdHpmkDN3I1vsg5Mn3d5H0C6dPTZqa9JsZGlxrtGb/ahPejZhVKDMTBZjO60g/v6fvjZztmXJ+xG6wqDpY=
X-Received: by 2002:a05:600c:1e15:b0:412:b689:5d88 with SMTP id
 ay21-20020a05600c1e1500b00412b6895d88mr27039wmb.3.1709128013828; Wed, 28 Feb
 2024 05:46:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226022452.20558-1-adamli@os.amperecomputing.com>
 <CANn89iLbA4_YdQrF+9Rmv2uVSb1HLhu0qXqCm923FCut1E78FA@mail.gmail.com> <a8de785f-8cc3-4075-a5f2-259e20222dcb@os.amperecomputing.com>
In-Reply-To: <a8de785f-8cc3-4075-a5f2-259e20222dcb@os.amperecomputing.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 28 Feb 2024 14:46:39 +0100
Message-ID: <CANn89iJAKEUu_Fdh0OC-+BJ+iVY0D2y0nAakGLxWZ8TywDu=BA@mail.gmail.com>
Subject: Re: [PATCH] net: make SK_MEMORY_PCPU_RESERV tunable
To: Adam Li <adamli@os.amperecomputing.com>
Cc: corbet@lwn.net, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	willemb@google.com, yangtiezhu@loongson.cn, atenart@kernel.org, 
	kuniyu@amazon.com, wuyun.abel@bytedance.com, leitao@debian.org, 
	alexander@mihalicyn.com, dhowells@redhat.com, paulmck@kernel.org, 
	joel.granados@gmail.com, urezki@gmail.com, joel@joelfernandes.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, patches@amperecomputing.com, 
	cl@os.amperecomputing.com, shijie@os.amperecomputing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 2:21=E2=80=AFPM Adam Li <adamli@os.amperecomputing.=
com> wrote:
>
> On 2/28/2024 4:38 AM, Eric Dumazet wrote:
>
> >>
> >> sk_prot->memory_allocated points to global atomic variable:
> >> atomic_long_t tcp_memory_allocated ____cacheline_aligned_in_smp;
> >>
> >> If increasing the per-cpu cache size from 1MB to e.g. 16MB,
> >> changes to sk->sk_prot->memory_allocated can be further reduced.
> >> Performance may be improved on system with many cores.
> >
> > This looks good, do you have any performance numbers to share ?
>
> I ran localhost memcached test on system with 320 CPU threads,
> perf shows 4% cycles spent in __sk_mem_raise_allocated() -->sk_memory_all=
ocated().
> If increasing SK_MEMORY_PCPU_RESERV to 16MB, perf cycles spent in
> __sk_mem_raise_allocated() drops to 0.4%.

I suspect some kind of flow/cpu steering issues then.
Also maybe SO_RESERVE_MEM would be better for this workload.

