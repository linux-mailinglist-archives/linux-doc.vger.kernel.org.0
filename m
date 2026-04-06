Return-Path: <linux-doc+bounces-82574-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAAIGi/M02lEmQcAu9opvQ
	(envelope-from <linux-doc+bounces-82574-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 06 Apr 2026 17:07:27 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C47063A488C
	for <lists+linux-doc@lfdr.de>; Mon, 06 Apr 2026 17:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5E2D301300B
	for <lists+linux-doc@lfdr.de>; Mon,  6 Apr 2026 15:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14783859DA;
	Mon,  6 Apr 2026 15:07:22 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from relay.hostedemail.com (smtprelay0011.hostedemail.com [216.40.44.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A303845D1;
	Mon,  6 Apr 2026 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488042; cv=none; b=OFyDFN7Ex8B3AYtnKAbjCFCSXCimmzJXVj55UQohLgBtjK9eEsAgbn/xvBoYCKf65imxGbivTNwlG+JNW6t4dbLu36BdyOegcnvOeyuGcgtMySOy/Fw47snlyMZm4pgNlIB8iS4WVpP40aAlU+TwiVUk27TauYpyCRjWNC8hXHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488042; c=relaxed/simple;
	bh=PM29/z47n2zYsho8v6UFDaJ35khN7jsuy86PKsuhmhE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S3OH8eDhFHVj9kqB6lBEcPv7TUZKOHQ7oRSbbExIKppKxSR2l4N6+YMOs94J9qjGaaoOmodJ5zZNxINVl4pcYdG0VKiHrTdilqkBwzKbbdEhQMFg+Hh01dl2/k/aJS+Dp9fIJw+sEQymrqMOhYsYOGimt+mr/dZuhJhAVGYFDMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 327D01B7FCF;
	Mon,  6 Apr 2026 15:07:20 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id 4EAE930;
	Mon,  6 Apr 2026 15:07:18 +0000 (UTC)
Date: Mon, 6 Apr 2026 11:08:29 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Bjorn Helgaas
 <bhelgaas@google.com>, linux-rockchip@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 0/3] PCI Controller event and LTSSM tracepoint
 support
Message-ID: <20260406110829.12f3e445@gandalf.local.home>
In-Reply-To: <u2dh2os5qyuuv636uwzttvohfyics7tvqiobheftjzdnuegq33@n77svn2nlqu2>
References: <1774403912-210670-1-git-send-email-shawn.lin@rock-chips.com>
	<u2dh2os5qyuuv636uwzttvohfyics7tvqiobheftjzdnuegq33@n77svn2nlqu2>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: ixe9nnprriq7mxpun5m6gf7xrpof86fk
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/uYBeCRxOtEh7TrxbGKZNQKuDClwoTA6I=
X-HE-Tag: 1775488038-770766
X-HE-Meta: U2FsdGVkX18p9VDqkHnORGbRcc0QXG5XI9F5Ld8pli7hj98TQXd50dWcWXwmuezbwzTOF//49UhUyN8vmkZhb5O4V6oiYTqoJ0OHNbW4GeD9jH6m4scWiK8gOWNBog8KJ3mwtCtegVRpUAWg37UUFmVKL88Y4IP2AoNCasIDXtokUk/nBJ1CaLVJtBhPtAHo9q4DokbOH9u+1AT3lSJ3XmUCZ/EDUT8i8x9JcCmkhCQalQbiulTpKc4avizmzJbzoWgVok8maeIWCVCKpzq21xyobxhFqOxx/hmE3ntQaCZHBELuEMao8Hp9J9VHmEptllvBa82VzULEnaDiGNp5WeYs5ylaz3o90+7z9tbINzusWfK12+Rq5MhawtuHBnXrzW8d5tshpNkY+aYCvL0Rlg==
X-Spamd-Result: default: False [-1.36 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[goodmis.org : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.967];
	R_DKIM_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rostedt@goodmis.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-82574-lists,linux-doc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[goodmis.org:email,gandalf.local.home:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C47063A488C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 4 Apr 2026 22:23:32 +0530
Manivannan Sadhasivam <mani@kernel.org> wrote:

> On Wed, Mar 25, 2026 at 09:58:29AM +0800, Shawn Lin wrote:
> > 
> > This patch-set adds new pci controller event and LTSSM tracepoint used by host drivers
> > which provide LTSSM trace functionality. The first user is pcie-dw-rockchip with a 256
> > Bytes FIFO for recording LTSSM transition.
> >   
> 
> Steve, could you please take a look at the tracing part?

I already have but didn't say anything because I didn't find anything ;-)

Anyway, for the tracing part:

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

