Return-Path: <linux-doc+bounces-74872-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMEXCqrDgGl3AgMAu9opvQ
	(envelope-from <linux-doc+bounces-74872-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 16:32:58 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E134CE486
	for <lists+linux-doc@lfdr.de>; Mon, 02 Feb 2026 16:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B10D300D63E
	for <lists+linux-doc@lfdr.de>; Mon,  2 Feb 2026 15:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A094217F33;
	Mon,  2 Feb 2026 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flDp5Qi9"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065DB366DD7;
	Mon,  2 Feb 2026 15:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770046193; cv=none; b=aLA7oft+qP70TuaNlwaGdsLWXH2NB+ec8zQxdAX0vomD9aOJQvS4mmAt73OFhjNguRePwWPTuz7fRy2XdfyheoChqV1JODfkjO0cXNu7UchHXBo1G2dkezIlAXl6v7FE4Flsxu1Ax3piqNn9uOrvQJEI1C2THahbSj8kcs4aGxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770046193; c=relaxed/simple;
	bh=hdTDTXPlle8rnOSCflXXpP2xx15aOGrUlA6yUqB9zpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWYlF6/WKiPjiMJBUYMZKwNjkDaR4ZxAh9DQc8BQxC1HgD4zquYBd2S0VO2XN2ADsUn+2ZVR/pQiJspjsIucxofRqsCya5P67VDnoSby07+ajDm5dTfZY+QYF/snZnHLYskPEgHTmfZZaSuxQJ6BcgID7Zf3WU1BeAu4BZ7sQhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flDp5Qi9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDA3CC116C6;
	Mon,  2 Feb 2026 15:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770046192;
	bh=hdTDTXPlle8rnOSCflXXpP2xx15aOGrUlA6yUqB9zpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=flDp5Qi9DnqSRKp74scNiKZ7oras0XAlvs1IKd2uSae2RKwjDR5CnICAGK1NopQaD
	 8sSTIMObfQvkQAseps3q4erfbi32vPMQoY/+E6iX72AYM0gG70Ul7cAfEb7wQ9TlHc
	 58FLUfxK2INSg66rZAOJgzTyhvqzfguevLgWApScJkuve6b8ikKBb3MT2DDqt/ZWGX
	 /QaYNhUkaQ5qpKY5dI2Gw4Ci0W81kJGGkDdRxVTxHJetaNfaJxWkXZw5hM3XCc/iXE
	 CJlA4yAiJvuVlm0nDMAVx25w4B8o3X0/HFrN8bGdHc9DX7Z82npl/bSyo6Jvzy7B0b
	 H7MGKgk3uwXkA==
Date: Mon, 2 Feb 2026 16:29:47 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: mani@kernel.org, kwilczynski@kernel.org, kishon@kernel.org,
	bhelgaas@google.com, corbet@lwn.net, jingoohan1@gmail.com,
	lpieralisi@kernel.org, robh@kernel.org, Frank.Li@nxp.com,
	linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] PCI: dwc: ep: Return after clearing BAR-match
 inbound mapping
Message-ID: <aYDC617a8s012LBl@ryzen>
References: <20260202145407.503348-1-den@valinux.co.jp>
 <20260202145407.503348-2-den@valinux.co.jp>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202145407.503348-2-den@valinux.co.jp>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-74872-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,google.com,lwn.net,gmail.com,nxp.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[valinux.co.jp:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8E134CE486
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 11:54:06PM +0900, Koichiro Den wrote:
> dw_pcie_ep_clear_ib_maps() first checks whether the inbound mapping for
> a BAR is in BAR Match Mode (tracked via ep_func->bar_to_atu[bar]). Once
> found, the iATU region is disabled and the bookkeeping is cleared.
> 
> BAR Match Mode and Address Match Mode mappings are mutually exclusive
> for a given BAR, so there is nothing left for the Address Match Mode
> teardown path to do after the BAR Match Mode mapping has been removed.
> 
> Return early after clearing the BAR Match Mode mapping to avoid running
> the Address Match Mode teardown path. This makes the helper's intention
> explicit and helps detect incorrect use of pci_epc_set_bar().
> 
> Suggested-by: Niklas Cassel <cassel@kernel.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

Reviewed-by: Niklas Cassel <cassel@kernel.org>

