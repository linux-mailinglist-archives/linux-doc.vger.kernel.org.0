Return-Path: <linux-doc+bounces-87635-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CzENW0aB2rnrgIAu9opvQ
	(envelope-from <linux-doc+bounces-87635-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 15:06:53 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9ED5502E1
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 15:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2FCD3184C6F
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 12:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C7D242D72;
	Fri, 15 May 2026 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOqYLJxf"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3B923EAA4;
	Fri, 15 May 2026 12:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778849251; cv=none; b=j4KT1oC+Mw4OOwYHrBKFhIC7nm79C9m2DYC1GoqP34t1yrFgIBnjYYsIgp8lGiYLkWAeRL5HWEc8VExVP2TaaEELhJ36MVIXLXxTdsMbXtlMPEc9oz+M+KhFAqBFd7XxdlTb/YziKbTfSKCI2DshSNd0jVSHu/+O5q+80sy+aow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778849251; c=relaxed/simple;
	bh=RutxBLw/fTqyWYne9ALFxGxyYBTrKY4dBcGpCUx/QLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/vXb38MEd3LGKbObNlz2AXx+e5iwDBUgcZEiea+fnHfd8NBth1oiORZCh8yvU6THAEWcfLxWVc3aTdKZEOIF0Cf1Pzx43MJlgihp+xQ7biAP4pfECLtub9fhY/XuUu3/XePyBU3NQORMRFdtKkh9NNCPHngsKCYo+wmM58Kkkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOqYLJxf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065FCC2BCB7;
	Fri, 15 May 2026 12:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778849250;
	bh=RutxBLw/fTqyWYne9ALFxGxyYBTrKY4dBcGpCUx/QLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EOqYLJxfBaT3DbXlN83O21rR2IWjpFpD16bBcbsEFx+OwTxbhNN8iNRxIdg03WBX2
	 g7HhVxvca6FcFAZc39BfEDW0kd2AvxAElL5X4jNDWx+6L0xYfbtYLasXHr4hOESWI6
	 50MLH7eiRkxoftXw93sMVQ5SOAM5SsRk0DExr2wJOyPWOa+75JWEviB1Edo/nSLOcD
	 skcDlEbcV+BFAdOUQmhVehP644dOep+jnmoWJSRd76omn+4GVHDDu38RU3hyvvTrBJ
	 unreLhq+tgTsVGEpkopvbOf6c476Fp8EMpAs56uI9rhnV6XEoFTYwX7B5BHeyx41LJ
	 rZhGMYQr2nmdA==
Date: Fri, 15 May 2026 18:17:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, linux-doc@vger.kernel.org, 
	kwilczynski@kernel.org, bhelgaas@google.com, corbet@lwn.net, kishon@kernel.org, 
	skhan@linuxfoundation.org, lukas@wunner.de, cassel@kernel.org, alistair@alistair23.me, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, s-vadapalli@ti.com, 
	danishanwar@ti.com, srk@ti.com
Subject: Re: [PATCH v3 3/4] PCI: endpoint: Add API for DOE initialization and
 setup in EPC core
Message-ID: <mn7rnqdunp4mq45a7ypf26rfpzjr2gik7w4p7hpj4x3r3fzfzz@dlrsn27u5mbf>
References: <20260427051725.223704-1-a-garg7@ti.com>
 <20260427051725.223704-4-a-garg7@ti.com>
 <m4z3q3pe3ro5vkl4uq4zkewpjdqccgeact2hj4tjnkonttx4vr@ndan37zzwgxc>
 <3853ba15-d096-4cf4-b52f-8a2e5f50fe53@ti.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3853ba15-d096-4cf4-b52f-8a2e5f50fe53@ti.com>
X-Rspamd-Queue-Id: 3A9ED5502E1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87635-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 10:21:52AM +0530, Aksh Garg wrote:
> 
> 
> On 14/05/26 13:38, Manivannan Sadhasivam wrote:
> > On Mon, Apr 27, 2026 at 10:47:24AM +0530, Aksh Garg wrote:
> > > Add pci_epc_setup_doe() API in EPC core driver to initialize and setup
> > > the DOE framework for an endpoint controller. The API discovers the DOE
> > > capabilities (extended capability ID 0x2E), and registers each discovered
> > > DOE mailbox for all the functions in the endpoint controller. This API
> > > should be invoked by the controller driver during probe based on the
> > > doe_capable feature.
> > > 
> > > Add pci_epc_destroy_doe() API in EPC core driver for cleanup of DOE
> > > resources, which should be invoked by the controller driver during
> > > controller cleanup based on the doe_capable feature.
> > > 
> > > Co-developed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > > Signed-off-by: Aksh Garg <a-garg7@ti.com>
> > > ---
> > > 
> > > Changes from v2 to v3:
> > > - Rebased on 7.1-rc1.
> > > 
> > > Changes since v1:
> > > - New patch added to v2 (not present in v1)
> > > 
> > > v2: https://lore.kernel.org/all/20260401073022.215805-4-a-garg7@ti.com/
> > > 
> > > This patch is introduced based on the feedback provided by Manivannan
> > > Sadhasivam at [1].
> > > 
> > 
> > Sweet! But I was expecting you to add atleast one EPC driver implementation to
> > make use of these APIs.
> > 
> > Also, why can't you call these APIs from the EPC core directly? Maybe during
> > pci_epc_init_notify() once the register accesses become valid.
> 
> Can we add the DOE initialization API to pci_epc_init_notify()? This
> API seems to be called to notify the EPF drivers that the EPC device's
> initialization has been completed, as the name and description suggests.

That's correct. But there is no harm in calling something like
pci_epc_init_capabilities() inside its definition. Only concern would be that
pci_epc_init_notify() is mostly called from threaded IRQ handlers. So loading
the handler would not be recommended. But since it is threaded anyway and we
don't have a better place to call, it would be OK.

We could've called this from pci_epc_{create/start}, but some controllers won't
allow accessing CSRs without REFCLK. So only after pci_init_notify(), CSRs can
be accessed.

> As 'pci_epc_doe_setup' is a part of EPC initialization, I thought the
> EPC drivers should call this API before calling the pci_epc_init_notify().
> 
> However, I agree with your suggestion to call the DOE setup API directly
> from the EPC core instead of sprinkling over the EPC drivers. I would
> recommend renaming the pci_epc_init_notify() API (and hence the
> pci_epc_deinit_notify() as well) to something like pci_epc_init_complete(),
> and add the DOE setup API/logic just before the
> logic of notifying the EPF devices.
> 

No need to rename this API. Just use as is:

	pci_epc_init_notify()
		-> pci_epc_init_capabilities()
			-> pci_epc_init_doe()
		-> epf->event_ops->epc_init()

- Mani

-- 
மணிவண்ணன் சதாசிவம்

