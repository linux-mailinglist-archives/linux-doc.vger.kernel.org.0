Return-Path: <linux-doc+bounces-86129-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCFfDGfv+2npIgAAu9opvQ
	(envelope-from <linux-doc+bounces-86129-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 03:48:23 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB744E2181
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 03:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8F052301DECB
	for <lists+linux-doc@lfdr.de>; Thu,  7 May 2026 01:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95443274B23;
	Thu,  7 May 2026 01:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aWugQRt/"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725C4239E7F;
	Thu,  7 May 2026 01:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778118497; cv=none; b=GZIolnE45JzDpvOka7v5jpHCCOPYiJhMBTg4FErKAXJ7Tbp7Id95DznVtZJJlr+J6+Q+/+RCmwINAl+6FNnpaVYfpRETn+8PExwVngDcw77CXuFQzE/EoZIwm2j16E1L4TFfmYCyfZ/ArqJCQNmwPKH2JQqp41k0EHKnqcfYMPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778118497; c=relaxed/simple;
	bh=5HhwpwRsS7l51LNkTWq7isiIqE6MqU9L41kkHsOjBHo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=TFxOfz0ptjCd5tlCUxPEYcHw9xemq3U7bSkI//Rg/v89eKRn9/QacnchoDE4pzq09KyL1OKFhn1pWKiSFdfRKRm3Lwbq/8KaRkXAXnD1ggRjVD/FOvk5+3PRHWMSFprvyaJoTjfg7ReAfCXoGotzMENsHyb9Py4KxQW2Blh4Gz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aWugQRt/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6E1C2BCB2;
	Thu,  7 May 2026 01:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778118497;
	bh=5HhwpwRsS7l51LNkTWq7isiIqE6MqU9L41kkHsOjBHo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aWugQRt/ObDuUE47cSe7pMkOH9qSHwAbj5d0teAwrGducRN8dyYgee9IK0WwmIsFg
	 gZTmmh2f0ahahBpdya+rgiqDSJpKfZ4ZKYZEjDIq/2KHG2NzlePCYUsSBXwMhybnSv
	 JjH2AMrsb/9sMioZmIdfcwQyGNiCwBmr6wQ3YBWGyk2MIqZn9ZStB+o1kZGHJeWrw/
	 VLjjAjSrdKs+y7euJTZpyOyDEKmE+Q5B0HXbaan+mFlJohYCXot8T5+E23uJEhL5qe
	 m6lcSH7Ivi8B1i/FNOX1Zlkwql4J9r9mwnU5FO/SnMU9VNZ+v6+DqP76LebSl20+HI
	 23B15sU9J0cmw==
Date: Thu, 7 May 2026 10:48:14 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Jonathan Corbet
 <corbet@lwn.net>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] fprobe: Add unregister_fprobe_sync() for synchronous
 unregistration
Message-Id: <20260507104814.528d32f1500f9350254a1c3f@kernel.org>
In-Reply-To: <20260428142736.11f5211a@gandalf.local.home>
References: <177729179863.401400.6063130067239479972.stgit@mhiramat.tok.corp.google.com>
	<20260428142736.11f5211a@gandalf.local.home>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8AB744E2181
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86129-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,goodmis.org:email]
X-Rspamd-Action: no action

On Tue, 28 Apr 2026 14:27:36 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Mon, 27 Apr 2026 21:09:58 +0900
> "Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:
> 
> > +/**
> > + * unregister_fprobe_sync() - Unregister fprobe synchronously with RCU grace period.
> > + * @fp: A fprobe data structure to be unregistered.
> > + *
> > + * Unregister fprobe (and remove ftrace hooks from the function entries) and
> > + * wait for the RCU grace period to finish. This is useful for preventing
> > + * the fprobe from being used after it is unregistered.
> > + *
> > + * Return 0 if @fp is unregistered successfully, -errno if not.
> > + */
> > +int unregister_fprobe_sync(struct fprobe *fp)
> > +{
> > +	int ret;
> > +
> > +	guard(mutex)(&fprobe_mutex);
> > +	if (!fp || !fprobe_registered(fp))
> > +		return -EINVAL;
> > +
> > +	ret = unregister_fprobe_nolock(fp);
> > +	if (ret)
> > +		return ret;
> > +
> > +	synchronize_rcu();
> 
> Hmm, do we really need to hold the fprobe_mutex when doing the
> synchronize_rcu()? This could cause other updates to have to wait longer
> too.

Good catch! Indeed, there is no need to hold the mutex.
OK, let me update it.

Thanks,

> 
> -- Steve
> 
> 
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(unregister_fprobe_sync);
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

