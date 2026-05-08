Return-Path: <linux-doc+bounces-86532-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJuSBIAl/mlTnQAAu9opvQ
	(envelope-from <linux-doc+bounces-86532-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 20:03:44 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F474FA597
	for <lists+linux-doc@lfdr.de>; Fri, 08 May 2026 20:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDE1B300F192
	for <lists+linux-doc@lfdr.de>; Fri,  8 May 2026 18:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A205D33F59B;
	Fri,  8 May 2026 18:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="mASBns6x"
X-Original-To: linux-doc@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68550221DB3;
	Fri,  8 May 2026 18:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778263420; cv=none; b=QF/unhsXBXy6HT7Fj/aXt2GaDhlrXED5fY58oOVmk+CM3kePj2coMImDVSlaJJYENb6A16prw7IyOjDAreQsj4Pgx3tXhGDYaplmKnAJfT9RiGFCqbe0OHSU2+jr7l9maXFL99ppGeM4rZSt3cVIdFbobyHXBr6yPFtOcqV1vjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778263420; c=relaxed/simple;
	bh=mT7hFidEP7AVCr+tnid5u2QIlN5qFuXSXKBplp8khd4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L2t7Qa0XeC74AVMeBR+TlNee8CnYhuSKMnVXi+9Dn737nntM5UvXX52zw+UBY+st0hABxbvZ4vye9pGPS3rLfgCv85COGvMFTLmEf8mc6NV4vG6zqjAcplnud/QUIMTg+E40c9/A5KfksYI3nhXrPR8h/CY5VHGBveFjA3dO36U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=mASBns6x; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from narnia (unknown [40.78.13.173])
	by linux.microsoft.com (Postfix) with ESMTPSA id 179B320B7169;
	Fri,  8 May 2026 11:03:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 179B320B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1778263412;
	bh=Q4c1yvumySi7QC6m/TuK0EoekCVJuBiX+wLaSpiId6I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mASBns6x9W+xeJRY88R3v2h9Vq29gQ/cSxoabEp8QTAoX9aGsAhBsu5r/VGTrHSl5
	 AeRisgsApzouWz8mlUGnU+fu45j7WaSV7neSkHyrYrjJmTkAttgfzMg36lL8rS4YFF
	 GSDYOeFuvB33I4M9XwSyUsuYo42Gu7s+4VTQu+VI=
From: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
To: Paul Moore <paul@paul-moore.com>
Cc: Jonathan Corbet <corbet@lwn.net>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=
 <mic@digikod.net>,
 =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, "Dr. David Alan
 Gilbert"
 <linux@treblig.org>, Andrew Morton <akpm@linux-foundation.org>,
 James.Bottomley@hansenpartnership.com, dhowells@redhat.com, Fan Wu
 <wufan@kernel.org>, Ryan Foster <foster.ryan.r@gmail.com>, Randy Dunlap
 <rdunlap@infradead.org>, linux-security-module@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, Song Liu <song@kernel.org>
Subject: Re: [v6 00/10] Reintroduce Hornet LSM
In-Reply-To: <CAHC9VhScmOoCtoFtccJ6x_cTdwvKCBfUyg=1p-kuAGmo=FdgwA@mail.gmail.com>
References: <20260429191431.2345448-1-bboscaccy@linux.microsoft.com>
 <CAHC9VhScmOoCtoFtccJ6x_cTdwvKCBfUyg=1p-kuAGmo=FdgwA@mail.gmail.com>
Date: Fri, 08 May 2026 11:03:29 -0700
Message-ID: <87v7cxaidq.fsf@microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 84F474FA597
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.microsoft.com,none];
	R_DKIM_ALLOW(-0.20)[linux.microsoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-86532-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,namei.org,hallyn.com,digikod.net,google.com,treblig.org,linux-foundation.org,hansenpartnership.com,redhat.com,kernel.org,gmail.com,infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bboscaccy@linux.microsoft.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.microsoft.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,paul-moore.com:email,paul-moore.com:url]
X-Rspamd-Action: no action

Paul Moore <paul@paul-moore.com> writes:

> On Wed, Apr 29, 2026 at 3:14=E2=80=AFPM Blaise Boscaccy
> <bboscaccy@linux.microsoft.com> wrote:
>>
>> This patch series introduces the next iteration of the Hornet LSM.
>> Hornet=E2=80=99s goal is to provide a secure and extensible in-kernel
>> signature verification mechanism for eBPF programs.
>
> I see that Fan identified a few issues that need resolution, but I
> just wanted to make sure you've read the expectations for a new LSM.
> To be clear, I think you've ticked all the boxes, and there is a
> MAINTAINERS entry with your name attached, but I just wanted to make
> sure you're okay with maintaining Hornet.  I like Hornet, I think it's
> a nice and fairly clever solution, but the last thing I need is a new
> LSM to maintain :)
>

Yes, I'm good with maintaining Hornet. Thanks Paul

-blaise

> https://github.com/LinuxSecurityModule/kernel#new-lsms
>
> --
> paul-moore.com

