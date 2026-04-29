Return-Path: <linux-doc+bounces-85163-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFawMTod8mm/oAEAu9opvQ
	(envelope-from <linux-doc+bounces-85163-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 17:01:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFE049670F
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 17:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8CFD03006B50
	for <lists+linux-doc@lfdr.de>; Wed, 29 Apr 2026 14:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2DC34AB06;
	Wed, 29 Apr 2026 14:52:42 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39ADC2727FD;
	Wed, 29 Apr 2026 14:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777474362; cv=none; b=PArtZ0UBGuY+P/0R46nraV9L14jq7DDmFPNs6rG/YO0ukrPHOXv3ZfnIrqh8smNakqbq3nkXb0GfiGKMq50USxHjwszhx3fog29NQqKCHUfyOQDoDW3HD1CqLfwN7/SpNk1e6E6T7ij9NaU1UyqTqGHshTXBXJqCVOfjm/XUMpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777474362; c=relaxed/simple;
	bh=9UoKVEVw1kIm0WZl8heNOTisVfH/IG40hANdcddrKro=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NVCHuQB6M5ivcNxVsXT0uc7eWvKU46whn2SkFYVoDtrx+PXzwKEEaw+E90sT050GUsSFig/NczVBZNMOmgiXdOAEMCpHPbRuCi2UKh5z9V6TFFDRvvLFEo4b2PZ7+KByX5OQ+SLzQvC3T5sYuqRq45tKfp0faFg24PU8Q/J8Ft0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf06.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id B933C1A0313;
	Wed, 29 Apr 2026 14:52:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf06.hostedemail.com (Postfix) with ESMTPA id A344B20011;
	Wed, 29 Apr 2026 14:52:28 +0000 (UTC)
Date: Wed, 29 Apr 2026 10:52:45 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: SUVONOV BUNYOD <b.suvonov@sjtu.edu.cn>
Cc: akpm <akpm@linux-foundation.org>, vbabka <vbabka@kernel.org>, linux-mm
 <linux-mm@kvack.org>, mhiramat <mhiramat@kernel.org>, mathieu desnoyers
 <mathieu.desnoyers@efficios.com>, linux-trace-kernel
 <linux-trace-kernel@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, surenb <surenb@google.com>, mhocko
 <mhocko@suse.com>, jackmanb <jackmanb@google.com>, hannes
 <hannes@cmpxchg.org>, ziy <ziy@nvidia.com>, david <david@kernel.org>,
 vishal moola <vishal.moola@gmail.com>, corbet <corbet@lwn.net>, skhan
 <skhan@linuxfoundation.org>, linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2] mm/page_alloc: trace PCP refills and PCP zone lock
 usage
Message-ID: <20260429105245.192e67a8@gandalf.local.home>
In-Reply-To: <1453063691.2584758.1777433513691.JavaMail.zimbra@sjtu.edu.cn>
References: <20260425091335.346504-1-b.suvonov@sjtu.edu.cn>
	<20260427060142.131055-1-b.suvonov@sjtu.edu.cn>
	<20260428142335.3bca0166@gandalf.local.home>
	<1453063691.2584758.1777433513691.JavaMail.zimbra@sjtu.edu.cn>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: hkat18xezybbqk5dyxadixumtmrtrta1
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/gO+H3IUx7sVHTPg/bx8A4FuIpjf3S24k=
X-HE-Tag: 1777474348-817918
X-HE-Meta: U2FsdGVkX1+bnbMuIeHV/UgJRUTOQxB6W5jOfn2Q0Tl/AkipVunZIoaSus3NWsVFId/CmDr8sy/VbnbG0pb/aIuMKsaKG1AeCyOC/v2A6T77ZyfIyT6VlTgf3ir5WFPnCzA+5p/LxM4uwNTx/t9CpfKW/bnRveONJSermvPB4/FoeRuVsFOmIgHwKUpLPtgfbLZj+FDkjYxsu7bchL/K2FcDIAq3ncdRKe8Dfc+R7VOLqVpUjNNDZEZfuuPD0rvxQsRxH0kK+nHQXABXhdOHwXmrCMyxfmtNcdCIC/XtQuEAHr5n76QSzc3c63+1BK6s
X-Rspamd-Queue-Id: 0DFE049670F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.94 / 15.00];
	SEM_URIBL(3.50)[sjtu.edu.cn:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,kvack.org,efficios.com,vger.kernel.org,google.com,suse.com,cmpxchg.org,nvidia.com,gmail.com,lwn.net,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-85163-lists,linux-doc=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[sjtu.edu.cn:query timed out];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[b.suvonov.sjtu.edu.cn:query timed out];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-doc@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.334];
	TAGGED_RCPT(0.00)[linux-doc];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.232.135.74:c];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sjtu.edu.cn:email]

On Wed, 29 Apr 2026 11:31:53 +0800 (CST)
SUVONOV BUNYOD <b.suvonov@sjtu.edu.cn> wrote:

> Thanks for reviewing Steven,
> 
> >Why this change? It makes it much harder to understand.
> >
> >The above is not a normal macro. Ignore any checkpatch warnings about it.
> >The proper way to do the TP_STRUCT__entry() is to make it just like a struct:
> >
> >struct {
> >	unsigned long		pfn;
> >	unsigned int		order;
> >	int			migratetype;
> >};
> >
> >Thus, the macro should be:
> >
> >	TP_STRUCT__entry(
> >		__field(	unsigned long,	pfn		)
> >		__field(	unsigned int,	order		)
> >		__field(	int,		migratetype	)
> >		),  
> 
> 
> Yeah sorry for the formatting issue, will fix in v3. Any other concerns?
> What do you think about the introduction of those tracepoints themselves?
>

It's a basic tracepoint and nothing unusual about it. I only watch over how
tracepoints are created and some use cases and make sure they are done
properly. But the introduction of tracepoints in other subsystems are up to
the maintainers of those subsystems. They are the ones that know what is
useful or not.

In other words, it's up to the MM subsystem maintainers to decide.

-- Steve
 

