Return-Path: <linux-doc+bounces-40647-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A68EA5E518
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 21:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E85443B8972
	for <lists+linux-doc@lfdr.de>; Wed, 12 Mar 2025 20:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B1A1EB1B8;
	Wed, 12 Mar 2025 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YZVWAjka"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69731E8823
	for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 20:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741810459; cv=none; b=UZN0aZYZQr6csG+TSuaGm2kJZT7JCXYUyykKatZjLDlB3HdRscFz+UqvqO7a3EmveseI4ScR0Y+gl5uE9pC5ttNxJ76HRg04B4wiapgiZe3qCJnmtb5PHoow+Xd+I1WhUkc8wQSncDCX94DQZxDMx3oFMNJEocMqHYGfxndS0QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741810459; c=relaxed/simple;
	bh=vKwigBB2IjpH6imGvsuAwuaflIRBbAP/S1v0i6KO5LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QNOGWwZdDQmaF1Ato/P6D4Jclg7pSLApjKp9YDIq9DsNUMvdf9cJtKvaxSQYGChriTs+k9UnQk/a+ghgdcpxgm+wrC01vyNfWNmWpXXv+LmvJij2D/rxW/Ml6u1WT5/GvGPx8SHF8EVv1tN6wtthBQ4RSSudn4Ta+kTE79WJzKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YZVWAjka; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2240aad70f2so11055ad.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 13:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741810457; x=1742415257; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EAXW43jmz+v892cmcTYK6Xn+BX9LwfhC4DPI6cYsApU=;
        b=YZVWAjka/pZL+jm1rAEPzis6W3crkE8X+IMDVvP7zEWVGOAUM/vXYwoi6C1fhzkE7b
         GT3qcEXVZRHhkLWghtBS5Rp7VY/Y68CjR0ojQmX8naiuwxPQ9sXmkX4hc2KcbD9oyFKs
         dkFjdVlWTPFcZjlFIrtnJrrCYlIdkc7ky7ZRY/T/+mMTtDZE9F18EARYwYpEy6P+qwfQ
         h/p7WoF5ITuBaD/slnU+E+R/gWiTYYPS85frJKiGJFqRsNBaXcw3A7EGykPKXIMQ3TNe
         a4wQ/I2sRBp2zXqboZahHY1LKNKVtPdrL50Q3miWABRREORw/6F+ZsLUoh6/WZPfSAtQ
         On8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741810457; x=1742415257;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAXW43jmz+v892cmcTYK6Xn+BX9LwfhC4DPI6cYsApU=;
        b=KOE+PVrwaCOXdJcOZwsCvzTxdd3niCHf0in/PcOOmRKLol3om76M8Hj+3fgGsNw5PV
         wZsNxve32VEx5c38uDZmtVj1Q6hllKZ8gQQp01/6KfHWXWCs5pdQAs7TIXIpHFeQnxKh
         P6rA6QdvMgvPoJuF5zr1EP6jMlCRuYBfJYQvsAcIrtJgXdtQdzt2KPYOx6OFlkdTiY9U
         lrXeVf9ZgmIBaOQ+aeLSQ2J9WkmIpCJIWry+UHr4WGDX55RBAvmgllHiZzaJMYdHONsh
         K54u3uNUiei2d8bLYlA2yFQWWHFLfi4jB8/z6Bpq2qIFzQwhtpUz07R3IA0zzlGcu1tN
         wClg==
X-Forwarded-Encrypted: i=1; AJvYcCVTD4tugDdUxqvYR6v6nxOrothGskX8Y2VTrVNX+9K9jFPnhDgaO11Pw7iYeZ/NdriGfzORih1W+0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4i9xdESoODapYYmlsPX0qUivZHZ2S924GeuWL+ErBRdvKT6Yc
	HbGp/Wn7ACIf2SRjfBhQIifuNjEatsJa80Xnb4tylDCGV28NV1Yq/2sNA/GN0A==
X-Gm-Gg: ASbGnctTe7vDcRu6UtRRXSHOnW5Rs4qpZzVBvA5q6x+A32w3WdCimWe2oRVaSnWUDpe
	YdaXRCZKxmp0AEnO1MdwpxT4NSRELNzhHx+AocI6Cut66XZPbAHPIEoA4LClgT9/fumKFJvOrFa
	Kpv0SG5h76KOXGRW6gnyPlRbM73jGBpwMYwCRCElrHW9mAze/wwY3p+wKUqMhTvuw8N3YDNUwA5
	zgt2X91rISPB37GbOKWjZ23NrQrTDfuaAO1uQf9hWLsXHPRDen368vv0W8MGAx9e1tgqCjeMdS3
	ZeV77LYZYjYeP5nvXlspbxpa9BaaEdf4flgRB/bRBWji0txBxFrczHuI7TXUKMMgYv4dPlfPCGW
	LnjLc0Vg=
X-Google-Smtp-Source: AGHT+IHtw1ysulsO8x8+o2O3j0n/z4qIqj3SYRhhQmpzlwQZjxNft8QHeLkmJtLVFUxToSP1/tTfxA==
X-Received: by 2002:a17:902:ec8f:b0:21b:b3c4:7e0a with SMTP id d9443c01a7336-225c5b6c66emr261875ad.13.1741810456662;
        Wed, 12 Mar 2025 13:14:16 -0700 (PDT)
Received: from google.com (57.145.233.35.bc.googleusercontent.com. [35.233.145.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa5166sm120318605ad.219.2025.03.12.13.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 13:14:16 -0700 (PDT)
Date: Wed, 12 Mar 2025 20:14:09 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Li Li <dualli@chromium.org>
Cc: "Cc:" <dualli@google.com>, corbet@lwn.net, davem@davemloft.net,
	edumazet@google.com, Jakub Kicinski <kuba@kernel.org>,
	pabeni@redhat.com, donald.hunter@gmail.com,
	Greg KH <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	tkjos@android.com, maco@android.com,
	"Joel Fernandes (Google)" <joel@joelfernandes.org>,
	brauner@kernel.org, Suren Baghdasaryan <surenb@google.com>,
	omosnace@redhat.com, shuah@kernel.org, arnd@arndb.de,
	masahiroy@kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>, tweek@google.com,
	LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, selinux@vger.kernel.org,
	Hridya Valsaraju <hridya@google.com>, smoreland@google.com,
	ynaffit@google.com, Android Kernel Team <kernel-team@android.com>
Subject: Re: Fwd: [PATCH v16 2/3] binder: report txn errors via generic
 netlink
Message-ID: <Z9HrEdbI5JYu0pwS@google.com>
References: <20250303200212.3294679-1-dualli@chromium.org>
 <20250303200212.3294679-3-dualli@chromium.org>
 <Z8-4SZv6plpyQUwf@google.com>
 <CANBPYPhR-C3VTv=ZHc1LJ0c7OG8-K2iGS62vXHmg9gcX0y89Cw@mail.gmail.com>
 <CANBPYPg5i5PhqV0-1foaKwNOaoKNoit6-cLUAqNu=2S0AUp==w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBPYPg5i5PhqV0-1foaKwNOaoKNoit6-cLUAqNu=2S0AUp==w@mail.gmail.com>

On Wed, Mar 12, 2025 at 11:49:02AM -0700, Li Li wrote:
> > > +     mutex_lock(&binder_procs_lock);
> > > +     hlist_for_each_entry(proc, &binder_procs, proc_node) {
> > > +             if (proc->pid == pid)
> > > +                     break;
> >
> > Wait... can't there be multiple binder_proc instances matching the same
> > pid? I know that binder_proc is a bit of a misnomer but what should you
> > do in such case? Shouldn't you set the flags in _all_ matching pids?
> >
> > Furthermore, there could be a single task talking on multiple contexts,
> > so you could be returning the 'proc' that doesn't match the context that
> > you are looking for right?
> >
> 
> You're right. I should update this logic to search the process within a
> certain binder_context only.

Also, note the comment about multiple 'struct binder_proc' matching the
same desired pid.

> > > +static void binder_netlink_report(struct binder_context *context, u32 err,
> > > +                               u32 pid, u32 tid, u32 to_pid, u32 to_tid,
> >
> > Instead of all these parameters, is there a way to pass the transaction
> > itself? Isn't this info already populated there? I think it even holds
> > the info you are looking for from the 'binder_transaction_data' below.
> >
> 
> The binder_transaction_data doesn't include all of pid, tid, to_pid and to_tid.

I'm not referring to binder_transaction_data, I mean 'struct
binder_transaction'. I _think_ this should have all you need?

> > > +     ret = genlmsg_multicast(&binder_nl_family, skb, 0, BINDER_NLGRP_REPORT, GFP_KERNEL);
> >
> > Thanks for switching to multicast. On this topic, we can only have a
> > single global configuration at a time correct? e.g. context vs per-proc.
> > So all listeners would ahve to work with the same setup?
> >
> 
> We only have a single global configuration, which can include both
> context and proc setup.
> Yes, all listeners work with the same setup as we have only one
> multicast group defined.
> The user space code can demux it by checking the context field of the
> netlink messages.

Ack. I understand the demux solution. I was wondering if we'll need to
OR the different configurations (per-proc and flags) from each listener
in that case.

> > > +TRACE_EVENT(binder_netlink_report,
> > > +     TP_PROTO(const char *name, u32 err, u32 pid, u32 tid, u32 to_pid,
> > > +              u32 to_tid, u32 reply, struct binder_transaction_data *tr),
> >
> > Similarly here I think you could get away with passing 'struct
> > binder_transaction' instead of all the individual fields.
> >
> 
> Same as above, the pid/tid fields are not in the struct
> binder_transaction (or redacted for oneway txns).

There is something off here. You have t->from_{pid|tid} and also
t->to_{proc|thead} that you can use. Isn't this what you are looking
for?

--
Carlos Llamas

