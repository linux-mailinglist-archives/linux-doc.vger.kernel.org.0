Return-Path: <linux-doc+bounces-90391-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGj7EcrYHWpsfQkAu9opvQ
	(envelope-from <linux-doc+bounces-90391-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 21:08:58 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5E36246D6
	for <lists+linux-doc@lfdr.de>; Mon, 01 Jun 2026 21:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 107CE3036708
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 19:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA61D367B9E;
	Mon,  1 Jun 2026 19:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BgkrFU4W"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DE83672A1
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 19:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780340927; cv=none; b=kivh+2hck2EPleAedoCoC+mdBCdpAQdYDkRJqc76JwI6qTWpl4OpYBod8cjHIucKaeGpHVdoy62+6IzFrPofkTGDnex3As8JRTcBT4ayfnMjFXU3EDiOt9uwA9xMuKm0DvLD4kUuoH9kFmj2vnA8aNCbZlczujcHmcQDQUsirq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780340927; c=relaxed/simple;
	bh=dZn3k7Cd4pvAmprGRxDQATCsMVFMDEIX9YcJonaBRe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VifBB8Syy9aUSY5KJ3GgN6bdxMzXmnsrbL0TewlvDbsLUwd1DJj5YpFS/QvntrAW3lRoJoQ4+DBglybD8RNalKbudjfBDj69l+j8Ds3tRAQ8FyvuJRi4bzKSDcMw5UiPb9DOIIyDjGL4zC620D+oTHpn9pw4Kl3Eu0B5alQGc5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BgkrFU4W; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA131F0089A
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 19:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780340926;
	bh=RoHlLdjCwXHhHBH6lmoj0WDBU93zAamK1pPlgM6/XWk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BgkrFU4WJJshnbb1PFIdbDKcuNkQL2Ho6QsTUSfru88NCcylwEMB3njwBMlioMcTi
	 mLnDpKv7gbxA/UkCRGueY+caCgBCg0xnExLb3Mjm1T20ca2vKskLgYzWg8kbi0NIoB
	 4HV3b2fQPtHk8Pc20sCjdF6WJLAIdbPENog4KVUgjg6ugVouJhzIKCU/b7AxIK3Xk2
	 Gi/4Fpyz1NiWaPv8FsOHY1LjXBINmtJFnQlGqgHm1HozJRziUH78aRTrwJdOh1B5P6
	 GTnVy8r8AUcFH10s/HewdNHYFLxJCEwRkEno9F7SrJnlqXNOJQAqAAr2EB8NtTZiwr
	 x4y495bt8jK1A==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa6cdebc33so1170604e87.2
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 12:08:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Sd/2rEHJXEMG6FHe5wpVcmtU/hvckXBTeGULqsfsi7dEsYweR+rHX2oaBRzmwsFZOQSIh+Wgz1Ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxOxZ7GO2MQ3Xc0TIcsAPJRGFmR4HTgmVoAkU3a90B3iBEdeRw
	FLUmlFbfTLtsmnK1vW2+6x6eMHq0j8Z3IK1DPgLZAaCUl6FlLxgSM73pM+oHakBK8MTTLTVjTlE
	994gW8Vq+JRiWi9YeDHlxgZXah3qLhWs=
X-Received: by 2002:a05:6512:39d0:b0:5aa:67ed:68a1 with SMTP id
 2adb3069b0e04-5aa74115903mr418878e87.11.1780340924845; Mon, 01 Jun 2026
 12:08:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260426160127.292486-1-atomlin@atomlin.com> <76opmfrrzgjgd2m7pnzjdd5h4a3bc3ofz4xwsxuavulnqslsm7@fuirka5jro5j>
In-Reply-To: <76opmfrrzgjgd2m7pnzjdd5h4a3bc3ofz4xwsxuavulnqslsm7@fuirka5jro5j>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 1 Jun 2026 21:08:33 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g4ksMwxqso8nagPO6s59fFzWt0YSv=SJ1ePF1bfgUCjw@mail.gmail.com>
X-Gm-Features: AVHnY4J8dEsrs9L6980IzkI6QEAyQmbwAvAuQ_l11Woig6ZGFA8nzc-hpFHDVGk
Message-ID: <CAJZ5v0g4ksMwxqso8nagPO6s59fFzWt0YSv=SJ1ePF1bfgUCjw@mail.gmail.com>
Subject: Re: [PATCH v5] PM: QoS: Introduce boot parameter pm_qos_resume_latency_us
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	pavel@kernel.org, lenb@kernel.org, zhongqiu.han@oss.qualcomm.com, 
	akpm@linux-foundation.org, bp@alien8.de, pmladek@suse.com, 
	rdunlap@infradead.org, feng.tang@linux.alibaba.com, 
	pawan.kumar.gupta@linux.intel.com, kees@kernel.org, elver@google.com, 
	arnd@arndb.de, fvdl@google.com, lirongqing@baidu.com, bhelgaas@google.com, 
	neelx@suse.com, sean@ashe.io, mproche@gmail.com, chjohnst@gmail.com, 
	nick.lange@gmail.com, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90391-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,oss.qualcomm.com,linux-foundation.org,alien8.de,suse.com,infradead.org,linux.alibaba.com,linux.intel.com,google.com,arndb.de,baidu.com,ashe.io,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,atomlin.com:email]
X-Rspamd-Queue-Id: BE5E36246D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 1, 2026 at 8:55=E2=80=AFPM Aaron Tomlin <atomlin@atomlin.com> w=
rote:
>
> On Sun, Apr 26, 2026 at 12:01:27PM -0400, Aaron Tomlin wrote:
> > This patch introduces the pm_qos_resume_latency_us kernel boot
> > parameter, which allows users to specify distinct resume latency
> > constraints for specific CPU ranges.
> >
> >       Syntax: pm_qos_resume_latency_us=3Drange:value;range:value...
> >
> > This boot parameter mirrors the sysfs interface behaviour: the special
> > string "n/a" imposes a 0us latency constraint (polling), while the
> > integer 0 removes the constraint entirely.
>
> Hi Greg, Rafael, Danilo, Pavel, Len,
>
> It has been over a month since I submitted this, so I just wanted to gent=
ly
> ping this thread.
>
> As a quick reminder, this parameter is highly beneficial for deployments
> that prefer to establish strict latency constraints early in the boot
> process, eliminating the need to rely on custom user-space tooling later
> on.
>
> Patch link: https://lore.kernel.org/lkml/20260426160127.292486-1-atomlin@=
atomlin.com/
>
> Please let me know if you have any conceptual concerns with this approach=
,
> if any further adjustments are required,

IMV it would be better to call the new command line arg something like
"cpu_idle_exit_latency_us" to make it clear what it is about.

Also, generally speaking, it should be part of cpuidle rather than the
generic QoS code that also applies to devices other than CPUs.

> or if you simply need me to rebase and resend this against the latest pow=
er management tree.

And that too.

Thanks!

