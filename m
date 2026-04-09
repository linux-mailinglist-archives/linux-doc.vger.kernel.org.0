Return-Path: <linux-doc+bounces-82902-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHoIGTW512l0SAgAu9opvQ
	(envelope-from <linux-doc+bounces-82902-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 16:35:33 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F20B3CC14B
	for <lists+linux-doc@lfdr.de>; Thu, 09 Apr 2026 16:35:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4C44A30055C7
	for <lists+linux-doc@lfdr.de>; Thu,  9 Apr 2026 14:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3022EC0A1;
	Thu,  9 Apr 2026 14:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="o8sA8NCU"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BE829B78D
	for <linux-doc@vger.kernel.org>; Thu,  9 Apr 2026 14:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745327; cv=none; b=SFNCfEu4D9TndRfSN4mkH85R6CuqiZDMjRahBLid5i6o8W9bugABInNmAbbGfLfAXbMBPjbjN3RIlXzogUWjXoZ1TEo1GGNhNssAbNuwDjV5LFViX78tZAeLqtRU81td3B/GTuOdOUhfpALkmXMCITBSe16qNIkn9XCZr1Wd/Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745327; c=relaxed/simple;
	bh=R5q0LVtb90UPAqO9Gzgc9ikyME60/+cjau376pxPJxA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=r0oYItjdhsMELy3gWhS7ydtngEeznK6DbDoO7q8EIVc+quhX+KAJi381sqifvuoeIcoKdrUEfz9e3yqyDSOGk2nNG9EhxdUiuW/DW9DC6OOzZ4PzmpGAc3DsuDp+A9O3Yd1UQ6Tccq7t7e3J0KeVllrvgGFe1UVmg+sYEXu6fpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=o8sA8NCU; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 272B8410A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1775745326; bh=mSRZsIZn7sByPUFuHbt2q9qsZitbvujJkF52ssGdp1c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o8sA8NCURTosVYyOuJmBbZq3CLfwT+7lBWAHhsTs8JlWfvoB/DXwsmplwnjM0+NRZ
	 fsk55JKARsusX3fd/adI0wvEn5dKuQiGUAQ46Hi3H+Vif+Pc5a41c1xV8jaaqeFC1o
	 KR8IhYEjwncN4Aly5eXk8xEfoXk4usr1OQcvH9JDY3P4BII3P7d/3E8X/aoHtcinQY
	 XEqYOpc9pEESPkrlVkZQ2kHj5bd30W5EkK+CfApyksgsriW8OilZJQ9WGqGON2xCj/
	 13pmfX1mk9/+CY/RiTSRO2JcHE5sepGkeUdTDebMb+1HxZ6g4fDJVrEXPi19chsCqK
	 3IkTn5UiHtosA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 272B8410A5;
	Thu,  9 Apr 2026 14:35:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Castro <arantescastro@gmail.com>, danielmaraboo@gmail.com
Cc: linux-doc@vger.kernel.org, Daniel Castro <arantescastro@gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: translate process/2.Process.rst
In-Reply-To: <20260330180207.30224-1-arantescastro@gmail.com>
References: <20260330180207.30224-1-arantescastro@gmail.com>
Date: Thu, 09 Apr 2026 08:35:25 -0600
Message-ID: <87se94b3rm.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-82902-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 6F20B3CC14B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Daniel Castro <arantescastro@gmail.com> writes:

> Add Brazilian Portuguese translation of the development process
> document (Documentation/process/2.Process.rst), covering the
> development cycle overview, patch lifecycle, subsystem trees,
> staging trees, tools, mailing lists, and getting started with
> kernel development.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Daniel Castro <arantescastro@gmail.com>
> ---
> v2: Fix stray line breaks throughout the file.
>
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../translations/pt_BR/process/2.Process.rst  | 502 ++++++++++++++++++
>  2 files changed, 503 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/2.Process.rst

Unfortunately, this patch does not apply to docs-next.  Please respin
and resend, and we'll get it in after the merge window.

Thanks,

jon

