Return-Path: <linux-doc+bounces-81480-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ArNItG7xWkeBAUAu9opvQ
	(envelope-from <linux-doc+bounces-81480-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 00:05:53 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CC833CE48
	for <lists+linux-doc@lfdr.de>; Fri, 27 Mar 2026 00:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D99C0306BD0A
	for <lists+linux-doc@lfdr.de>; Thu, 26 Mar 2026 23:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256072857C7;
	Thu, 26 Mar 2026 23:00:26 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E12561A2;
	Thu, 26 Mar 2026 23:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774566026; cv=none; b=soBjENwVJb04hU4YCVLh13WQpnLz8E46jMaAbICdOfETaOcL+QvL0kPiju7+LvuG4Ogb49/PmEQ5b37CeYox9JgGNOY+EQWe0VJFbDLp739dZVZ1BP6y+O06VDADB7vlgj2DQyvxJkoytReLEu+qzXqhSReZ8Fe7qnkLFI9BAz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774566026; c=relaxed/simple;
	bh=VOmqstW0nS5TjYcKlkNTy+hJsCHIFVmtDdm7nDccrC4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nJ6zqremji95YQXMm/FPJjBbF1RMoj2yUfduF2f2saQfaNaUJKZbWTvEYRLnCTwD5GmPMpyoWe4rEirKktReNLko/TujbJXuhxfbXkJtiMQIUCa/U02unfiaip9IJXFcIpRgGp44eYFFb2LNznwMLbPpCS+ZKB+EXpewn2lAl10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id A04631A0F09;
	Thu, 26 Mar 2026 23:00:21 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf03.hostedemail.com (Postfix) with ESMTPA id 667756000C;
	Thu, 26 Mar 2026 23:00:17 +0000 (UTC)
Date: Thu, 26 Mar 2026 19:01:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Frederic Weisbecker <frederic@kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Gabriele Monaco <gmonaco@redhat.com>, Ingo
 Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Marcelo
 Tosatti <mtosatti@redhat.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Michal Hocko <mhocko@kernel.org>, "Paul E .
 McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Phil
 Auld <pauld@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Valentin
 Schneider <vschneid@redhat.com>, Vlastimil Babka <vbabka@suse.cz>, Waiman
 Long <longman@redhat.com>, linux-doc@vger.kernel.org, Sebastian Andrzej
 Siewior <bigeasy@linutronix.de>, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2] doc: Add CPU Isolation documentation
Message-ID: <20260326190104.4c399247@gandalf.local.home>
In-Reply-To: <20260326190022.4b249f94@gandalf.local.home>
References: <20260326140055.41555-1-frederic@kernel.org>
	<6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>
	<20260326190022.4b249f94@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: aauo8oidnbbf5m3s59efo5xjkfzodx3n
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/cM1q0ZF6UGu7J8LhSt2MSOPc8y9UGVYE=
X-HE-Tag: 1774566017-923840
X-HE-Meta: U2FsdGVkX1+rjdQ0+UqIsNno9jEEuSzZF374b1J4Q8GU4NZidE/He9LKGjcPKIzqTTRaZBaeHA6amWnBhg6rhpm8rccvd4ZkdQu6BKp3oDqya4KS0wr03Mrh7A7MB9l7RbdMY3Ru7SHa88TG+DUWjCU5BSR8nxu+petgImLWzlEh238oJBmOSREX1t2X8UtLyfUzrCNhMAVYnPb1/oowd8vW79lvBgm3mz6tCaOtUri28GexJS+aymYn5XmkuyIEFre32MoFTWENED4sr8IrIJ1GWGLvaVBzShHGTgPRSAl6yb7NK1Cgc7oFWNFFSmN/aasFXLLRNUiHieiiCVTJtFkCCWlTePFt9dotEYJ/nb47Hqq90Aa6q/cP8T/FhXUBiVgIfB6xBZ2YN0TeM0rS5w==
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,linutronix.de,redhat.com,lwn.net,suse.com,infradead.org,suse.cz,gmail.com];
	TAGGED_FROM(0.00)[bounces-81480-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gandalf.local.home:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,goodmis.org:email]
X-Rspamd-Queue-Id: F0CC833CE48
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 26 Mar 2026 19:00:22 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> Being read by C programmers, I would keep he ',' out of the quotes as it
> looks like a string literal "noun,".

  Or was that supposed to be: a string literal "noun,."  ;-)

-- Steve

