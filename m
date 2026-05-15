Return-Path: <linux-doc+bounces-87673-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL0PFSwtB2pSsgIAu9opvQ
	(envelope-from <linux-doc+bounces-87673-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:26:52 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D9355163D
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 16:26:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10168301750E
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 14:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F213939C9;
	Fri, 15 May 2026 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="tVnAfO71"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E30B3A7F4A;
	Fri, 15 May 2026 14:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778855147; cv=none; b=ej53+0Nuv+tH0nYTrcMJSzpkmW5e5UqFEnnw8qKNL4jh6X93TscN2oiq6z5djEVP/ghHIckF+M1dsuEwkMSqZ9Ozvwv9Krii8OMF4yzw58kJ75YUOKh1PuYKrxilNasBjB1CP8xdIwgFUuWxA86Lb3S7SYMacn7SRSpXiPv2vmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778855147; c=relaxed/simple;
	bh=96o3cdvGPS5Xe62c/suk0phFsRwGUqp4fy3N+KjEyws=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HL869LmDVo6ZIqct8pwtpR6fjqs9VuyOfiG1Hdq8fFNrq2GqMjsbfjImPdzYdxyM/SfvhYCbUJwmyT3e08XZAorQjvdqNLUlelKktC1CapLzbyFl3TSvuw1aAMLA0d0AFHwiQsVeqSeKWO3l3UzHbu0aBcY/lQGPPK7xm4v1pow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=tVnAfO71; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 46912410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778855143; bh=0HTXufkJYMGhYK+gGEUIo0j7Bw+/wGaonu9tKsd5fGk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tVnAfO71iDiNOkdrwP1oINCzSb5/DpXcNSb/2ffStQeEDm2MZBXry/ikgS5pQSshP
	 ZC79t9nHiv4kj+PCDTHVo40POfql8clq44lrdy2KrbQNIgq5oZXXOv+NklL+REP0XK
	 GVTHSG8SdirSs98+Fd1qM5wqABFFJhg+ayC+fIh0xrHQGXuorhPYSDVOzXH64Fspc0
	 fSNSSNsGa6YzTtxpkN3SYF2o8KhSgnFvo/TRBy5kHrsPlp6mtOqIiea/FtyaA7UlIG
	 4vtcBwSYVFLanQGyVAC3aN3l46dQ1lU3s1J8beawPTJKWbRsyiaiyYjU5BbYnx0QkD
	 DlrFflo2L404g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 46912410B5;
	Fri, 15 May 2026 14:25:43 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Costa Shulyupin <costa.shul@redhat.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Ryan Cheevers <cheeversr0@gmail.com>, Waiman
 Long <longman@redhat.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] docs: housekeeping: Fix struct member access in code
 example
In-Reply-To: <agMseHkMBF04ecS3@localhost.localdomain>
References: <20260501043855.980567-1-costa.shul@redhat.com>
 <87wlxkczyy.fsf@trenco.lwn.net> <agMseHkMBF04ecS3@localhost.localdomain>
Date: Fri, 15 May 2026 08:25:42 -0600
Message-ID: <875x4orbq1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C7D9355163D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87673-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,linuxfoundation.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Frederic Weisbecker <frederic@kernel.org> writes:

> Le Sun, May 03, 2026 at 08:47:01AM -0600, Jonathan Corbet a =C3=A9crit :
>> Costa Shulyupin <costa.shul@redhat.com> writes:
>>=20
>> > No such array housekeeping_cpumasks
>> >
>> > Fix to housekeeping.cpumasks.
>> >
>> > Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
>> > ---
>> >  Documentation/core-api/housekeeping.rst | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/c=
ore-api/housekeeping.rst
>> > index 92c6e53cea75..ccb0a88b9cb3 100644
>> > --- a/Documentation/core-api/housekeeping.rst
>> > +++ b/Documentation/core-api/housekeeping.rst
>> > @@ -99,7 +99,7 @@ the same RCU read side critical section.
>> >  A typical layout example would look like this on the update side
>> >  (``housekeeping_update()``)::
>> >=20=20
>> > -	rcu_assign_pointer(housekeeping_cpumasks[type], trial);
>> > +	rcu_assign_pointer(housekeeping.cpumasks[type], trial);
>> >  	synchronize_rcu();
>>=20
>> This looks actively wrong to me.  I think it should be:
>>=20
>>   housekeeping_cpumask(type)
>>=20
>> ... Frederic ... ?
>
> No, Costa is right, housekeeping.cpumasks[type] is where we store
> the pointer. housekeeping_cpumask(type) is only an accessor.
>
> So:
>
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

OK, then, applied, thanks.

jon

