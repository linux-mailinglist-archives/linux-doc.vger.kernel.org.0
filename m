Return-Path: <linux-doc+bounces-92434-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rb+gJzx5MGrCTQUAu9opvQ
	(envelope-from <linux-doc+bounces-92434-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 00:14:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DD368A4E7
	for <lists+linux-doc@lfdr.de>; Tue, 16 Jun 2026 00:14:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UiPAPa9z;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92434-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-92434-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5817E3013B90
	for <lists+linux-doc@lfdr.de>; Mon, 15 Jun 2026 22:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB013B71D3;
	Mon, 15 Jun 2026 22:14:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49663305693;
	Mon, 15 Jun 2026 22:14:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781561653; cv=none; b=JlAlpUavFW6n9GkB4+U0XnLscSz+gthlxBqFf7bxlHOYzfxrGwAGq+HkoX0+JgZXFIoA0YAJLkag4docBbQ8ZrxMVI/G91CbMXXuMuGlRTjr38SdenWvQ6hFJKExC2YJcIy0vNIWQv29hmgwNTEQcG7Cm5F4uzx015nX8380N0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781561653; c=relaxed/simple;
	bh=sVprY7PouF3RmhfTPbrq9rGf43UMc7bxrzxuhZsvCJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A3irPf5SAqSlN/Te24zNvQv6km+d92P44+GPR12YRklusKKevWYJ///2tqMCVf14fkWXJnr2DT2H5SntI7/MhfKzJtmv+sX25DDWUMY1vvx82VOg7cwZhGmIGQjfl80IF7wFp85hbptybyXgHl9B9RzPPKgscWmauA33X4onobg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UiPAPa9z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63431F000E9;
	Mon, 15 Jun 2026 22:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781561651;
	bh=HoY62TWG3USyfrv4K40Mof0mBqYsQixr2LFxTUwTjFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UiPAPa9zcJMm0tSx74C2rr5+OJCf4YeK4rcnIyhCzGd+2FeXf7/TGpxxNpVhERTsD
	 fvnCZxh0wV0adIZGVZ8uXXC3fhp4xq0Ilhn6F06MY+NqcBQT9/Ufg5wzm/wK2YnaHS
	 azN34FXtsdcFP6WBL5LMGVCUqeHeSZdNm4VK8c77Ypwsx93bDZRTfcaNEk35yr3Rma
	 OLCy3XFAIZ9PT3nRyrBtkSn3q/9SxeeG7yZpobLMRG8mhQ13VWBFxBG2hXlN4o+z4U
	 eXqABT9u1Rjy1UcCFb56N1UOs25PaqcYhJ1Iou76VTWPEGJlEtvcByFOL0DjJsOjuj
	 RjcT8hADPwoxQ==
Date: Mon, 15 Jun 2026 17:14:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-doc@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	puranjay@kernel.org, usama.arif@linux.dev, philip.radford@arm.com,
	devicetree@vger.kernel.org, souvik.chakravarty@arm.com,
	linux-kernel@vger.kernel.org, jic23@kernel.org, elif.topuz@arm.com,
	lukasz.luba@arm.com, sudeep.holla@kernel.org, leitao@kernel.org,
	vincent.guittot@linaro.org, james.quinlan@broadcom.com,
	kernel-team@meta.com, linux-arm-kernel@lists.infradead.org,
	kas@kernel.org, arm-scmi@vger.kernel.org, peng.fan@oss.nxp.com,
	linux-fsdevel@vger.kernel.org, michal.simek@amd.com,
	brauner@kernel.org, etienne.carriere@st.com, d-gole@ti.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, f.fainelli@gmail.com
Subject: Re: [PATCH v4 06/31] dt-bindings: firmware: arm,scmi: Add support
 for telemetry protocol
Message-ID: <178156164845.1820518.478350687908291764.robh@kernel.org>
References: <20260612223802.1337232-1-cristian.marussi@arm.com>
 <20260612223802.1337232-7-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260612223802.1337232-7-cristian.marussi@arm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92434-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cristian.marussi@arm.com,m:linux-doc@vger.kernel.org,m:conor+dt@kernel.org,m:puranjay@kernel.org,m:usama.arif@linux.dev,m:philip.radford@arm.com,m:devicetree@vger.kernel.org,m:souvik.chakravarty@arm.com,m:linux-kernel@vger.kernel.org,m:jic23@kernel.org,m:elif.topuz@arm.com,m:lukasz.luba@arm.com,m:sudeep.holla@kernel.org,m:leitao@kernel.org,m:vincent.guittot@linaro.org,m:james.quinlan@broadcom.com,m:kernel-team@meta.com,m:linux-arm-kernel@lists.infradead.org,m:kas@kernel.org,m:arm-scmi@vger.kernel.org,m:peng.fan@oss.nxp.com,m:linux-fsdevel@vger.kernel.org,m:michal.simek@amd.com,m:brauner@kernel.org,m:etienne.carriere@st.com,m:d-gole@ti.com,m:krzk+dt@kernel.org,m:f.fainelli@gmail.com,m:conor@kernel.org,m:krzk@kernel.org,m:ffainelli@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.dev,arm.com,linaro.org,broadcom.com,meta.com,lists.infradead.org,oss.nxp.com,amd.com,st.com,ti.com,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-doc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 33DD368A4E7


On Fri, 12 Jun 2026 23:37:36 +0100, Cristian Marussi wrote:
> Add new SCMI v4.0 Telemetry protocol bindings definitions.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> v3 --> v4
>  - changed protocol number to lowercase 1b
>  - fixed misplaced block for protocol 0x1b
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


