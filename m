Return-Path: <linux-doc+bounces-87119-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAc8N1s5A2qh1wEAu9opvQ
	(envelope-from <linux-doc+bounces-87119-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 16:29:47 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFB65227E8
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 16:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 186E730AD53B
	for <lists+linux-doc@lfdr.de>; Tue, 12 May 2026 13:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E35390609;
	Tue, 12 May 2026 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpqCiBya"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4023E1730;
	Tue, 12 May 2026 13:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592892; cv=none; b=LYUxp/YB+xbeYZi7ttPMl6Z6V/kSPdvFFMoH29Lfrvku27WAQgUoymf4BuB/dW97BzXNACT8RR25lwGOWOoDND4SSwePSfHDVqeHC1aiC20TLbey+CYyCZxtHckX+oeLr6WNNxqJuaebAJ66CWaThPYl3bldRkKVUwigD8sMfIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592892; c=relaxed/simple;
	bh=3Q6kkk7cWe6mmRPvpAmIJukKdHkwc8Nnad6wdrHurdg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UefTnHP1212d49UUvzDvwZUk6DrkBfKnKP+99Vbtaqz7CgK1+KDhfjlHxHv8r5EkJvLakLy0oL2PRW+wPcNQGtkTFwhF3KDbvRyGCqwnoEH6gQFgnar5/05uGo4P4cy6yKUn5gdqKjr8Uase2eIOZfGbOi0JNVbYcbBGyA2ax5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpqCiBya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F870C2BCB0;
	Tue, 12 May 2026 13:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778592891;
	bh=3Q6kkk7cWe6mmRPvpAmIJukKdHkwc8Nnad6wdrHurdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XpqCiByabaJUk1ggCxr9yUUnV8QuO8SRn05KM43RT9JL8PtRYDCej8vVBFo+LRw1K
	 xee6YIcb1KMPA/aCcfWMsoArCgR2aRwvqsiYu8VmEUmN/xdVosoRbnFzoTR8mXplIY
	 ih7UIfaCU/CsQm/bsHVLnvw+pyZn+pT15TRZFCw8ejkX0uK8PMdK1bQgoaoc/faGK+
	 3g732TISby/NJHtbYZIaIahhC63Z/R4b4VZ9p51jwHgNxIeafNCAxUE7V/CsMcKGXx
	 Y7qtz+5Fs3Shzwh81Py2bMl+aPq4AYSixRVCXdmVUOqWvippfEceIZXyxH0OPhgx7C
	 4qRXqJxIai8ig==
Date: Tue, 12 May 2026 15:34:48 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Costa Shulyupin <costa.shul@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ryan Cheevers <cheeversr0@gmail.com>,
	Waiman Long <longman@redhat.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] docs: housekeeping: Fix struct member access in code
 example
Message-ID: <agMseHkMBF04ecS3@localhost.localdomain>
References: <20260501043855.980567-1-costa.shul@redhat.com>
 <87wlxkczyy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wlxkczyy.fsf@trenco.lwn.net>
X-Rspamd-Queue-Id: 4AFB65227E8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87119-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[redhat.com,linuxfoundation.org,gmail.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,localhost.localdomain:mid]
X-Rspamd-Action: no action

Le Sun, May 03, 2026 at 08:47:01AM -0600, Jonathan Corbet a écrit :
> Costa Shulyupin <costa.shul@redhat.com> writes:
> 
> > No such array housekeeping_cpumasks
> >
> > Fix to housekeeping.cpumasks.
> >
> > Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> > ---
> >  Documentation/core-api/housekeeping.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
> > index 92c6e53cea75..ccb0a88b9cb3 100644
> > --- a/Documentation/core-api/housekeeping.rst
> > +++ b/Documentation/core-api/housekeeping.rst
> > @@ -99,7 +99,7 @@ the same RCU read side critical section.
> >  A typical layout example would look like this on the update side
> >  (``housekeeping_update()``)::
> >  
> > -	rcu_assign_pointer(housekeeping_cpumasks[type], trial);
> > +	rcu_assign_pointer(housekeeping.cpumasks[type], trial);
> >  	synchronize_rcu();
> 
> This looks actively wrong to me.  I think it should be:
> 
>   housekeeping_cpumask(type)
> 
> ... Frederic ... ?

No, Costa is right, housekeeping.cpumasks[type] is where we store
the pointer. housekeeping_cpumask(type) is only an accessor.

So:

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Thanks!

-- 
Frederic Weisbecker
SUSE Labs

