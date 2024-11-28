Return-Path: <linux-doc+bounces-31681-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3619DB0A5
	for <lists+linux-doc@lfdr.de>; Thu, 28 Nov 2024 02:17:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 563C4B21370
	for <lists+linux-doc@lfdr.de>; Thu, 28 Nov 2024 01:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0B117BA3;
	Thu, 28 Nov 2024 01:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="JNznA7ig"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B397C4A24
	for <linux-doc@vger.kernel.org>; Thu, 28 Nov 2024 01:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732756642; cv=none; b=rkmCLcclKxwfC30wOTlejIWmZBAzJZvZfJrgBdSQWXo6TJn1R+SnJXfD9KN5CIOgGbAbeo+fXoGsDR7+vwShe388+aF1arbwlMaGjxpuQXghrWTSUeb2oAJQtpB0Q/3YT314Ql2Sad1XhvhdRAcklyprwK+bw4VomzX0gWtPikM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732756642; c=relaxed/simple;
	bh=nPRaiq0SJhGnl1iSyp9jl3bLS0Yneb+Vch/oBsW+H90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YM+boU5qsBp1hbqCwcxRfISNzpuLkhZNOxSCO6vIE2/obbhaWTiJUsgC8ymEStQYJ15ININvtMSq8nKIFx8T3Q4+ZZhhVJDoNlzKfQhpG4LndUlwHW63T/mAAPtUNCy1iBZB7+wd/Nnv/fdznZoDAmpRNgrFS9WHZMgKgN/IFr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=JNznA7ig; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21271dc4084so1809565ad.2
        for <linux-doc@vger.kernel.org>; Wed, 27 Nov 2024 17:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1732756640; x=1733361440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5DcGEzrHk2gERpvGZBV2PuGdStuwT9md+uuPhMNkDQ=;
        b=JNznA7igqEkkgoDXTONX1stSjGzXjUmc8TIuKtziXY2nGII2u2THVjQfDo9S1jEfzJ
         YHHfTGvG+NvUDYuDtizKgG7si3SQbByeEPoaVeT8/l5VSbr6Q7AUrqLOOYhT/nuTCXY/
         X6ZEkkGbTiikB0TVD8kC8XMPeO5fuGUl1vH64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732756640; x=1733361440;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5DcGEzrHk2gERpvGZBV2PuGdStuwT9md+uuPhMNkDQ=;
        b=EJmGQms7n81VUnf+qn+0mNMJRLszNdiqmV4kZxnLnOtwPXYIHlt2VPYiLzNMkwnDST
         BB+wC8OLIeIq/OEQQnVjhNVmHU6uSwWzqD6I0Q1T3frxidEDSkAHQn5t+6FLaGidDhT+
         HPGabij1KFXKoJsuuStyhkoel349BTnBbEw+JYZtoO6rFiP81M0kZqn5SIpF2JM3rfqc
         L79tmq0HrFgG3+C2ekpxbxhUCAZe98KK9PJ0n4BIbCiRwdOVfrCKKekXCIlw3pR/X1+B
         owPmGF7JJEaaRVtHaV/c+j9jMqY7VvvrNPgef+sq+iexE2aaMKqKxtDtweuzwKBqiJ4s
         SWjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXUv6LcE3rmOwq+C5KeLKbz5YpG4ApfggRqzHVulPr0JqqzcbDzbFhNiUv+DcDsntxhgTfbXFes5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YymtXqlAPB17842P4+PqDaEs7BezP05ed6zLNI9C3mVm7PH+35k
	KyBsvm+vf6BlZfTso0/psJlbmdFRQJ1D5TCUtQPXCZJWjhkrnAru3U+q8lClPCg=
X-Gm-Gg: ASbGncv/ysbKnHYPac5kkQmZjI4RbS7FHXXmKoplYQYfn5nK75bMQCV9ppH/ddUcIWk
	9V243DO39SRtguc67/zhJycW6+JdhS1Qn7ALnC3ATMTVY2n5PbLY0GW+zRnSEahlC04SAH631ho
	AJGm2xVP6cVv1ufQpgY57xtmO5GSBcEdN5a8JUBy3fhQz3cl0DY0tk6i+MCiQnoqJy7NjYztWiw
	WvtdWakDZ55ETZla0GSO/zGRIvFCHK+v4QKBGiu5VyNSw/XJJ7HHDC9Jlq9qT6NuTbapE6EyLcL
	0k3HIQcadnAbjQNa
X-Google-Smtp-Source: AGHT+IGE+SbHIvhY6rG+SteKGEe8I4rNMmWwevKGrlhoAj3A0MpScjcGaiwO5WlpLNxVoT1PM26T2g==
X-Received: by 2002:a17:902:e94c:b0:20b:8a93:eeff with SMTP id d9443c01a7336-21501c60a6amr78114945ad.37.1732756639412;
        Wed, 27 Nov 2024 17:17:19 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215219a781fsm1899105ad.219.2024.11.27.17.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 17:17:18 -0800 (PST)
Date: Wed, 27 Nov 2024 17:17:15 -0800
From: Joe Damato <jdamato@fastly.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, skhawaja@google.com,
	sdf@fomichev.me, bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	edumazet@google.com, Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, pcnet32@frontier.com
Subject: Re: [net-next v6 5/9] net: napi: Add napi_config
Message-ID: <Z0fEm2EmZ6q1c9Mu@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Guenter Roeck <linux@roeck-us.net>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, skhawaja@google.com, sdf@fomichev.me,
	bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	edumazet@google.com, Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, pcnet32@frontier.com
References: <20241011184527.16393-1-jdamato@fastly.com>
 <20241011184527.16393-6-jdamato@fastly.com>
 <85dd4590-ea6b-427d-876a-1d8559c7ad82@roeck-us.net>
 <Z0dqJNnlcIrvLuV6@LQ3V64L9R2>
 <f04406c5-f805-4de3-8a7c-abfdfd91a501@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f04406c5-f805-4de3-8a7c-abfdfd91a501@roeck-us.net>

On Wed, Nov 27, 2024 at 01:43:14PM -0800, Guenter Roeck wrote:
> On 11/27/24 10:51, Joe Damato wrote:
> > On Wed, Nov 27, 2024 at 09:43:54AM -0800, Guenter Roeck wrote:
> > > Hi,
> > > 
> > > On Fri, Oct 11, 2024 at 06:45:00PM +0000, Joe Damato wrote:

[...]

> > It seems this was triggered because before the identified commit,
> > napi_enable did not call napi_hash_add (and thus did not take the
> > napi_hash_lock).
> > 
> > So, I agree there is an inversion; I can't say for sure if this
> > would cause a deadlock in certain situations. It seems like
> > napi_hash_del in the close path will return, so the inversion
> > doesn't seem like it'd lead to a deadlock, but I am not an expert in
> > this and could certainly be wrong.
> > 
> > I wonder if a potential fix for this would be in the driver's close
> > function?
> > 
> > In pcnet32_open the order is:
> >    lock(lp->lock)
> >      napi_enable
> >      netif_start_queue
> >      mod_timer(watchdog)
> >    unlock(lp->lock)
> > 
> > Perhaps pcnet32_close should be the same?
> > 
> > I've included an example patch below for pcnet32_close and I've CC'd
> > the maintainer of pcnet32 that is not currently CC'd.
> > 
> > Guenter: Is there any change you might be able to test the proposed
> > patch below?
> > 
> 
> I moved the spinlock after del_timer_sync() because it is not a good idea
> to hold a spinlock when calling that function. That results in:
> 
> [   10.646956] BUG: sleeping function called from invalid context at net/core/dev.c:6775
> [   10.647142] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 1817, name: ip
> [   10.647237] preempt_count: 1, expected: 0
> [   10.647319] 2 locks held by ip/1817:
> [   10.647383]  #0: ffffffff81ded990 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_newlink+0x22a/0x74c
> [   10.647880]  #1: ff6000000498ccb0 (&lp->lock){-.-.}-{3:3}, at: pcnet32_close+0x40/0x126

[...]

> This is due to might_sleep() at the beginning of napi_disable(). So it doesn't
> work as intended, it just replaces one problem with another.

Thanks for testing that. And you are right, it is also not correct.
I will give it some thought to see if I can think of something
better.

Maybe Don will have some ideas.
 
> > Don: Would you mind taking a look to see if this change is sensible?
> > 
> > Netdev maintainers: at a higher level, I'm not sure how many other
> > drivers might have locking patterns like this that commit
> > 86e25f40aa1e ("net: napi: Add napi_config") will break in a similar
> > manner.
> > 
> > Do I:
> >    - comb through drivers trying to identify these, and/or
> 
> Coccinelle, checking for napi_enable calls under spinlock, points to:
> 
> napi_enable called under spin_lock_irqsave from drivers/net/ethernet/via/via-velocity.c:2325
> napi_enable called under spin_lock_irqsave from drivers/net/can/grcan.c:1076
> napi_enable called under spin_lock from drivers/net/ethernet/marvell/mvneta.c:4388
> napi_enable called under spin_lock_irqsave from drivers/net/ethernet/amd/pcnet32.c:2104

I checked the 3 cases above other than pcnet32 and they appear to be
false positives to me.

Guenter: would you mind sending me your cocci script? Mostly for
selfish reasons; I'd like to see how you did it so I can learn more
:) Feel free to do so off list if you prefer.

I tried to write my first coccinelle script (which you can find
below) that is probably wrong, but it attempts to detect:
  - interrupt routines that hold locks
  - in drivers that call napi_enable between a lock/unlock

I couldn't figure out how to get regexps to work in my script, so I
made a couple variants of the script for each of the spin_lock_*
variants and ran them all.

Only one offender was detected: pcnet32.

So, I guess the question to put out there to maintainers / others on
the list is:

  - There seems to be at least 1 driver affected (pcnet32). There
    might be others, but my simple (and likely incorrect) cocci
    script below couldn't detect any with this particular bug shape.
    Worth mentioning: there could be other bug shapes that trigger
    an inversion that I am currently unaware of.

  - As far as I can tell, there are three ways to proceed:
    1. Find and fix all drivers which broke (pcnet32 being the only
       known driver at this point), or
    2. Disable IRQs when taking the lock in napi_hash_del, or
    3. Move the napi hash add/remove out of napi enable/disable.

Happy to proceed however seems most reasonable to the maintainers,
please let me know.

My cocci script follows; as noted above I am too much of a noob and
couldn't figure out how to use regexps to match the different
spin_lock* variants, so I simply made multiple versions of this
script for each variant:

virtual report

@napi@
identifier func0;
position p0;
@@

func0(...)
{
	...
	spin_lock_irqsave(...)
	...
	napi_enable@p0(...)
	...
	spin_unlock_irqrestore(...)
	...
}

@u@
position p;
identifier func;
typedef irqreturn_t;
@@

irqreturn_t func (...)
{
	...
	spin_lock@p(...)
	...
}

@script:python depends on napi && u@
p << u.p;
func << u.func;
disable << napi.p0;
@@

print("* file: %s irq handler %s takes lock on line %s and calls napi_enable under lock %s" % (p[0].file,func,p[0].line,disable[0].line))

