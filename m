Return-Path: <linux-doc+bounces-63240-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14147BD7991
	for <lists+linux-doc@lfdr.de>; Tue, 14 Oct 2025 08:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB7C33B1168
	for <lists+linux-doc@lfdr.de>; Tue, 14 Oct 2025 06:43:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FD5F2D12EE;
	Tue, 14 Oct 2025 06:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CUS0zvyh"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EAD2C3262
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 06:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760424208; cv=none; b=tUr/SVswpi1yC4IhbBfe6xatWso7SFl4Pt92gSjuYWzNgQ44EBgDdVRPMqcVxp8MM2VzvLjNvrzW78PPkCeqmutCQz46oJBDqfeqzbfd4oAHGiSIvinoOMt/vpAMEBKbhgY5Dt3G73jBzcsImJ63v9mFH+wGkWa75BUrJmO8xnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760424208; c=relaxed/simple;
	bh=8BmtnVuF+NR+683lGUyRlkHB0hCfWgNPU/uJQGt18PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZP4YIDusyJfTuE9jGG0lNIwIl0NUOBcykpxIqCILNTabnhlCdwaSf8kU6qYsc8RPV7b1cr0mJ+/3ZE7NItcfHmktPzrn6xmI5pG7CFHrBet8s/HHV3fx4eChN67M0+7hUkAPOPaD49+RTluwD0v3krIhKavGAqCTF4yTFBwTj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CUS0zvyh; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-855733c47baso969217985a.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 23:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760424206; x=1761029006; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MhrDyaN2J3TqzVAMvoBpM4UfVuraiqPhFHlfn6YNa1Q=;
        b=CUS0zvyhgV2/Go22Y7HkQ19GOeOGM7KKKP/JOjpK1ecUY32SpPMkhlzMCad2Pngq3I
         ghnd72vjwOUWBfzW1GQ2LkjOdpClhw4Y+vd/FvRwH1Q0L5L1LVbf+G9agyg5oszD6lst
         mFwbc0HBY092wPiXq9dBHw2Twl7zFWS+rmsgoEM9g01v3Y69XBiU6Zb0R28hJjwEJrsf
         DUTrZX4rXGDfaeXl5MiQENJ5nnJ/6F2LTGR2nVumQDmqzc2kyPEAIW/6I3sV6N50Z10k
         019NEAHfXny7YSruo2tyCkmp5PclMHCw+/gaX1U6Pg8wxkfplCUZAaAi+Ukc2kQ+bwdr
         Un6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760424206; x=1761029006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MhrDyaN2J3TqzVAMvoBpM4UfVuraiqPhFHlfn6YNa1Q=;
        b=G/9fOyn0OUC80gv3mwdo4QChaUJpIOqgaISdplmMuiyPFXKL2hOPrSHPN/z9uLfXNB
         1Jh2wNbmcVz7DNImOaMh7HeX/jWgBmJCjK6sga1BM0TocWNOMPXIPZXCBu50m6w42BNa
         8vu8YCvN2D1lnQxF7B/wIvW7SRzHE4xT3+kwTwpneS4wne8xJG6fIwh7q30vjO6rhcbT
         hQZkMVu4uNYVrtH59NMto5vrx8V8SF5FSZIdNI3P6yKhOUUjn54YCVrk6WKHjEy84Nop
         Jzar8TObUwlAhCE1gD9Ubr7yefXy3J+AiAE8mKL/do9ZHmT3der1WgJfYDMMLe5CFVwv
         z1vw==
X-Forwarded-Encrypted: i=1; AJvYcCXlbsVKKNHrQKLi/bHc/LhfQcKZmEFyhM2/6MMXZhBIfKVto44lAKTdjs5QFvuUey9YCrbePn7yJZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJIbls+FQAWEb9LFbeATRUdMvIjve61tv41hng/eTls4YnauXb
	DdMxeUdeLR2DeYpNllD9rg4nrsZPmzcoxgBAWM8EWwyYgLYHGtwgdydE/FPcMVsfXU/gsuHFiMk
	qGgek4wZhecuF/MRL/sItcAHJdviBSsY=
X-Gm-Gg: ASbGncsmQAcbJATdls/CoXhROrU6wkxWZ68uy89pOQKZmzsC2ysQxe0nO6aTZ18VS0v
	Pqlubv0GetBAvhQO0EcomrkHnBTgCh55cWlT/24KDJ7rb1j2NrqCWhtzZ+R+giAlusTKAyyoU+0
	OYNlg/e4p4zcFRUtqlk+YcL+HFVnywsifwJiMZzxFIqqXnhq3bPV9shFB1Je7ae5Q1DEtx6p6eQ
	mN8+qBZ4kYahbHatskb54F53pITznMc7u3fI3C4ZSL3Mk1Ny25dHgFWXlwys9BMYaG6H1Jii2q3
	dX4=
X-Google-Smtp-Source: AGHT+IFYutlmQKCrkDt8XJQ+cgRq1f7xMcV72qnx5j0NhR1+uR1WTW9C1BFQIW6/sa8OGzcLx/Y98zV9viwi45m4nU0=
X-Received: by 2002:a05:620a:1709:b0:848:6b67:ea57 with SMTP id
 af79cd13be357-883502b6ce7mr3038377185a.16.1760424205591; Mon, 13 Oct 2025
 23:43:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANn89i+wikOQQrGFXu=L3nKPG62rsBmWer5WpLg5wmBN+RdMqA@mail.gmail.com>
 <20251014035846.1519-1-21cnbao@gmail.com> <CANn89iKCZyYi+J=5t2sdmvtERnknkwXrGi4QRzM9btYUywkDfw@mail.gmail.com>
In-Reply-To: <CANn89iKCZyYi+J=5t2sdmvtERnknkwXrGi4QRzM9btYUywkDfw@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 14 Oct 2025 14:43:13 +0800
X-Gm-Features: AS18NWBkvzMB1sYbudY7gB27K6cY5x7_rxgh42n5L8scA-jiQSzN7FZuNS0QWLY
Message-ID: <CAGsJ_4ySSn6B+x+4zE0Ld1+AM4q-WnS0LfxzWw22oXr7n5NZ=g@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network buffer allocation
To: Eric Dumazet <edumazet@google.com>
Cc: corbet@lwn.net, davem@davemloft.net, hannes@cmpxchg.org, horms@kernel.org, 
	jackmanb@google.com, kuba@kernel.org, kuniyu@google.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linyunsheng@huawei.com, mhocko@suse.com, netdev@vger.kernel.org, 
	pabeni@redhat.com, surenb@google.com, v-songbaohua@oppo.com, vbabka@suse.cz, 
	willemb@google.com, zhouhuacai@oppo.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"

> >
> > A problem with the existing sysctl is that it only covers the TX path;
> > for the RX path, we also observe that kswapd consumes significant power.
> > I could add the patch below to make it support the RX path, but it feels
> > like a bit of a layer violation, since the RX path code resides in mm
> > and is intended to serve generic users rather than networking, even
> > though the current callers are primarily network-related.
>
> You might have a buggy driver.

We are observing the RX path as follows:

do_softirq
    taskset_hi_action
       kalPacketAlloc
           __netdev_alloc_skb
               page_frag_alloc_align
                   __page_frag_cache_refill

This appears to be a fairly common stack.

So it is a buggy driver?

>
> High performance drivers use order-0 allocations only.
>

Do you have an example of high-performance drivers that use only order-0 memory?

Thanks
Barry

