Return-Path: <linux-doc+bounces-86267-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKICMNDV/GlvUQAAu9opvQ
	(envelope-from <linux-doc+bounces-86267-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 20:11:28 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C1F4ED40E
	for <lists+linux-doc@lfdr.de>; Thu, 07 May 2026 20:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DBB5D300E689
	for <lists+linux-doc@lfdr.de>; Thu,  7 May 2026 18:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D57D450904;
	Thu,  7 May 2026 18:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqCydUi4"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2503537C105;
	Thu,  7 May 2026 18:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778177481; cv=none; b=qaFiPWdIQOuMFQC//GPVFmGqlqY3Hrd8G5Xly1i4C8SuuodAydoBOL/WriAMBvg/+F013VNuTocqQ54haqsfeVfmyfIGZJEc7hugDHtY3ZtiDtOw2CvHU+HEkxCBKi2XB0V7DMSC33wLp4Xht9srPAgeubz4oOAd+rKVsyJZArc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778177481; c=relaxed/simple;
	bh=c256iUMzuzb0xFvRcQcErKbiOUKlJ8SaT6kFuGeQXWE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TTfHFP89JHYnULjbI0RSpShvKPnkvUGPb0R7crDXV4jcpfInh64R0ouT/Duhw4JTK8U2Iox2+bUWWeZxVgIjyMFUmKtzNm5ryTKBWPa7EoZp82wt/OiZ6SrLNkwOhExIUC5MfkF8Kf5VOoWlqIuCigEdJhfSubpZiyjERtrIMao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqCydUi4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9E2C2BCB2;
	Thu,  7 May 2026 18:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778177480;
	bh=c256iUMzuzb0xFvRcQcErKbiOUKlJ8SaT6kFuGeQXWE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tqCydUi4EdjOm1rR2FLi81GM5ORzlsT/PtGYn7DMAYMYA+Hw+TxW4lV+MC8hIS+Kw
	 rNF4ZDeubEQk2JDhUzikhD3tvPp2JaIt4cdYJmcdbXw8D8lo3qK7hVlzFGagINhDz3
	 nq27y61N0xwdg8iX5FNi1HeOvqYbvaB+QFZQj/Y+dum5mNBJVVdFy9dHCmEFbnmj/L
	 L6VzUj0x6mxEI8QPBtgoLMSn1dMr6VkITEH48l41Ul5Ht6QkoRxhKg8STQPqDBu7x8
	 P+JMUngQm/4PzrQMofs62Rg+cc6BmgxcJZMDb5XcyY5luhprL8ByON4W5p2x1BHI/T
	 j/m3escbXLTew==
Date: Thu, 7 May 2026 19:11:07 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dave Jiang <dave.jiang@intel.com>
Cc: Terry Bowman <terry.bowman@amd.com>, dave@stgolabs.net,
 alison.schofield@intel.com, djbw@kernel.org, bhelgaas@google.com,
 ming.li@zohomail.com, Smita.KoralahalliChannabasappa@amd.com,
 rrichter@amd.com, PradeepVineshReddy.Kodamati@amd.com, lukas@wunner.de,
 Benjamin.Cheatham@amd.com, sathyanarayanan.kuppuswamy@linux.intel.com,
 vishal.l.verma@intel.com, alucerop@amd.com, ira.weiny@intel.com,
 corbet@lwn.net, rafael@kernel.org, xueshuai@linux.alibaba.com,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH v17 04/11] cxl: Rename find_cxl_port() to
 find_cxl_port_by_dport()
Message-ID: <20260507191107.752b043e@jic23-huawei>
In-Reply-To: <c5d40fc5-e8e0-4fa4-94af-4ea08c2f370b@intel.com>
References: <20260505173029.2718246-1-terry.bowman@amd.com>
	<20260505173029.2718246-5-terry.bowman@amd.com>
	<c5d40fc5-e8e0-4fa4-94af-4ea08c2f370b@intel.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C3C1F4ED40E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86267-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,amd.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Tue, 5 May 2026 15:06:42 -0700
Dave Jiang <dave.jiang@intel.com> wrote:

> On 5/5/26 10:30 AM, Terry Bowman wrote:
> > From: Dan Williams <djbw@kernel.org>
> > 
> > find_cxl_port() and find_cxl_port_by_uport() are internal port lookup
> > functions that search the CXL bus by dport and uport respectively, but
> > their names do not make the lookup method clear.
> > 
> > Rename find_cxl_port() to find_cxl_port_by_dport() to make the lookup
> > method explicit and consistent with find_cxl_port_by_uport(). Both
> > functions remain static to port.c; the upcoming patch that adds the
> > first cross-file caller will widen their scope.
> > 
> > Co-developed-by: Terry Bowman <terry.bowman@amd.com>
> > Signed-off-by: Terry Bowman <terry.bowman@amd.com>
> > Signed-off-by: Dan Williams <djbw@kernel.org>  
> 
> Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>

Could pick this one up independently / early given it's useful for
readability.

