Return-Path: <linux-doc+bounces-7570-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A81C183D15A
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jan 2024 01:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB11B1C23D41
	for <lists+linux-doc@lfdr.de>; Fri, 26 Jan 2024 00:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC97D18D;
	Fri, 26 Jan 2024 00:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="SLpqS0QE"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A84633
	for <linux-doc@vger.kernel.org>; Fri, 26 Jan 2024 00:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706227894; cv=none; b=iHJXp5fdvy94jBARdR64wQAk9e29opcgE6zZN/19BVwz9zf3l2z1PziNyXo1wiXlMOlCJpf3aCOp/RBH5EwhWyshSwc50C6vCrBsu/zbej+SEdS4mMbgAMqZvVwstyDjhIrYzXCN8oq3EGn2oNhaIj/r3LWhIr2GA9clW9p7luE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706227894; c=relaxed/simple;
	bh=tS1D/gC3eczV4hc9F7HIorCotTTkm6mnvxscD4v6Lmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=exhSYh568znXmsiUYFuPxxygd8Nl7wXIZRcKc/U6dwpqOVryZ4+8Cv//8wW85t/JqcWArMRQbpQqF9S4Re8LnzVA5vw9qSuPGOPsq8rxAqVEXL/+AdZWRfMvAE26Wm9bXSEtwugdZLz0vBJUnrye5ZtRRtFXPHIDZ3h5W70DFPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=SLpqS0QE; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d746ce7d13so42902595ad.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 16:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1706227893; x=1706832693; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GloqAGaE/8Xt5EH+nEjxDsFciv6uGLru4K2wOJLFbuY=;
        b=SLpqS0QE4w8luvxKbPVs2v4sG9kn8FfJ5NXxIFbRIQSvf5cDB4lSzet3I+FEf6DH6k
         Ya4COsKKQjC8B0wvlVvLpmI3NuhfaMh1LzQE4ar1m5np4jmPDIftq1T8QG4lzO7YXx1b
         MgGab/TqBd6SZa9Wsvjbc68+8v8NB0nHsqBlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706227893; x=1706832693;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GloqAGaE/8Xt5EH+nEjxDsFciv6uGLru4K2wOJLFbuY=;
        b=Tg0iKMxP64stvTpa9nRRUdm0mmYkZ5ETpXSNlnoLRUctQEV+jdWPuMIlQkd5Wk9Gd+
         uWCeazvhgRa5MekR7N734GxX53QacDl4dPnE1BDEh/t2gZBLg1t7ZQMHVeC82y1AygB+
         aiJA4qz2JeQHPWweu8FzyWw6LgQqLNyM2oyk3ZpkPr2Mmz8wAFKHHNiWdESXXse/Ssqt
         ZhtG3S/6MIS92YMFZ2MZsWq2fpPbvNHvwx4hF6PBrZ2cS8ESgxVWqZeGyOvJQOrj1t/3
         t4OrhSBwBWLSIYp3W3erNwa7eVZxGaaJY1J3+h7B97o1Y/0ff4pgd3GJGdMw65LxF0tb
         XYww==
X-Gm-Message-State: AOJu0YyLYBtVkFjzYBrun/RBaG+E2Cvf3yrgBnmkfOVXtaapFyZu+MOR
	eYQSYeDqReyVa8Btyx62dlxVUt9OC2Pwok28NCwhBMWY6rfLK40zoAEEbmLtbb0=
X-Google-Smtp-Source: AGHT+IGBb/9rSx28R5bqGae1Ih6pLXBUZpviP2v/EZH+ry1x0sFiesGEC78wJnmgSEFLUxy3GHYlvg==
X-Received: by 2002:a17:902:6509:b0:1d4:868b:7ccc with SMTP id b9-20020a170902650900b001d4868b7cccmr455778plk.111.1706227892703;
        Thu, 25 Jan 2024 16:11:32 -0800 (PST)
Received: from fastly.com (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id mn7-20020a1709030a4700b001d49a08495esm66286plb.118.2024.01.25.16.11.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jan 2024 16:11:32 -0800 (PST)
Date: Thu, 25 Jan 2024 16:11:28 -0800
From: Joe Damato <jdamato@fastly.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	chuck.lever@oracle.com, jlayton@kernel.org,
	linux-api@vger.kernel.org, brauner@kernel.org, edumazet@google.com,
	davem@davemloft.net, alexander.duyck@gmail.com,
	sridhar.samudrala@intel.com, kuba@kernel.org,
	willemdebruijn.kernel@gmail.com, weiwan@google.com,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Lynch <nathanl@linux.ibm.com>,
	Steve French <stfrench@microsoft.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	Julien Panis <jpanis@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
	Andrew Waterman <waterman@eecs.berkeley.edu>,
	Thomas Huth <thuth@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	"open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH net-next v3 3/3] eventpoll: Add epoll ioctl for
 epoll_params
Message-ID: <20240126001128.GC1987@fastly.com>
References: <20240125225704.12781-1-jdamato@fastly.com>
 <20240125225704.12781-4-jdamato@fastly.com>
 <2024012551-anyone-demeaning-867b@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024012551-anyone-demeaning-867b@gregkh>
User-Agent: Mutt/1.5.24 (2015-08-30)

On Thu, Jan 25, 2024 at 03:21:46PM -0800, Greg Kroah-Hartman wrote:
> On Thu, Jan 25, 2024 at 10:56:59PM +0000, Joe Damato wrote:
> > +struct epoll_params {
> > +	u64 busy_poll_usecs;
> > +	u16 busy_poll_budget;
> > +
> > +	/* for future fields */
> > +	u8 data[118];
> > +} EPOLL_PACKED;
> 
> variables that cross the user/kernel boundry need to be __u64, __u16,
> and __u8 here.

I'll make that change for the next version, thank you.

> And why 118?

I chose this arbitrarily. I figured that a 128 byte struct would support 16
u64s in the event that other fields needed to be added in the future. 118
is what was left after the existing fields. There's almost certainly a
better way to do this - or perhaps it is unnecessary as per your other
message.

I am not sure if leaving extra space in the struct is a recommended
practice for ioctls or not - I thought I noticed some code that did and
some that didn't in the kernel so I err'd on the side of leaving the space
and probably did it in the worst way possible.

Thanks,
Joe

