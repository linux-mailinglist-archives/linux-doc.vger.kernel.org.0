Return-Path: <linux-doc+bounces-87586-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKCeHbfABmo2ngIAu9opvQ
	(envelope-from <linux-doc+bounces-87586-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 08:44:07 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2483354A17B
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 08:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD0CA301FFA2
	for <lists+linux-doc@lfdr.de>; Fri, 15 May 2026 06:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF242383C6F;
	Fri, 15 May 2026 06:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WRaOCCNq"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3D1382F1D;
	Fri, 15 May 2026 06:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778827435; cv=none; b=CGjswHiG+pyFJq6Kvpze9xyH+ctSPuxTcXsjPFvVUS6Wht76srBYK2eYI2lswW5X0YKrisyIjMzMw1ESHuuDuM/GMAWehBfmynu4XnYTat+JPBk3vAcNzzuAVjTDXQT7sjgiqsfVGUcZarViTNki9MpXSnLinPT41iqhii+Vlis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778827435; c=relaxed/simple;
	bh=I58VdQFMUKXo8PZU5IovKieuw/MW5rBPpKTnZLHl/mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBhdAZlNfnks0h6rdZl0kA0RTzcen0Z0ZvMexASRRuARlyOrCqMl2V4wk+3bOkMiBaS5qrVBeLaoIMHZFqzcHacLvSlQ3/AJJlCvuWoW0R4UyGkrENPzsJ4ttPL+GoBK4fRg9lgiQP78JcXib6XBcacN2UpJTa4I2wB/ZwYGRw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WRaOCCNq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66F6C2BCB0;
	Fri, 15 May 2026 06:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778827435;
	bh=I58VdQFMUKXo8PZU5IovKieuw/MW5rBPpKTnZLHl/mo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WRaOCCNqxCOkrIXhOp7gtJR/nxS0KzV3nse4AeiEQ85hDoIt25S+3iV15ug98xpXY
	 HxBJgpgRBfEE2eeDOJlXhDEp0CfAVlTYCZEGVHIlMQD9vIRVM8wBzgnPyFO8URt9ia
	 SNkF5F+Z+GVuh96jdvovjySGDRL/2fLlIA6ln4iW+Eb/UQCKcCKPMupm8H8m7a/V53
	 mFchWD2WJLPx67rj9YeF+fYfwlBuIlXSP2QNdWfged6l3oxz/F0en9Gk+Nq9FrvVx5
	 WCQDDtW1WI8ewDEp3XrDOLxKaF77JlS2VZR2y54s9QV7UHYpALU87ulXcminKn/adc
	 X3t3MXN03vZ4w==
Date: Fri, 15 May 2026 08:43:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: trivial-devices: Add Murata D1U74T
 PSU
Message-ID: <20260515-melodic-nimble-gorilla-21c7ed@quoll>
References: <20260514-d1u74t-v4-0-1f1ee7b002ec@nexthop.ai>
 <20260514-d1u74t-v4-1-1f1ee7b002ec@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260514-d1u74t-v4-1-1f1ee7b002ec@nexthop.ai>
X-Rspamd-Queue-Id: 2483354A17B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-87586-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nexthop.ai:email,qualcomm.com:email]
X-Rspamd-Action: no action

On Thu, May 14, 2026 at 08:03:25PM -0700, Abdurrahman Hussain wrote:
> The Murata D1U74T-W series are hot-pluggable 1U AC/DC front-end
> power supplies in the Intel CRPS-185 / OCP M-CRPS form factor.
> Each variant delivers a 12 V main output plus a 12 V standby output
> from a wide AC input (90-264 Vac) or HVDC supply, and includes an
> internal variable-speed cooling fan and on-board voltage, current,
> power, fan-speed, and temperature telemetry.
> 
> The host-side digital interface is a PMBus 1.2 port on I2C.  The
> PSU's other electrical signals (status, alert, current-share) live
> on the CRPS edge connector and are consumed by the chassis
> controller rather than the host SoC, so there are no host-described
> supplies, GPIOs, clocks, or interrupts.  Add the compatible to
> trivial-devices.yaml rather than carrying a standalone binding file.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


