Return-Path: <linux-doc+bounces-81166-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKWZNp6hw2lBsQQAu9opvQ
	(envelope-from <linux-doc+bounces-81166-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 09:49:34 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B23D3219C9
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 09:49:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7FEE304851F
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 08:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BCFD39A07F;
	Wed, 25 Mar 2026 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etwMqJpS"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A0B39A05D;
	Wed, 25 Mar 2026 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428569; cv=none; b=KqECQx2Zy8AySSeQ/VHPzPMJo79hmyKqFhY2AKmSdug6bY6SddW71SFNQfFoRIu9BCUnFTagsNNjMCyMWED5NWPaenW+/V42kInlxeLMZncw+WlLFcRf+mtCu1LzNm6mH7lcjXkL67ZMF4JckMshj3Qqvl9GHZvkU65aZim42Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428569; c=relaxed/simple;
	bh=xQmO7EJXl1PoTtMOtJVG6NGd02VYJTyAaCn3EEcWWss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alGCEXT0nZY5XJzkxtvWgdLJNvULSKXqP4sPRXyO+Urz4byTcu27Je9Qd8VED79D4OrAVmQFSnaKe/2bf0n7cBF9VStQ1340KXwd8EmUWHJoqbpRD40d3uCVWbP9vQA0S4ea0qUUieEwNyRkxNiflu43Wt9I7L+sGM0XUrXrtZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etwMqJpS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780E7C4CEF7;
	Wed, 25 Mar 2026 08:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774428569;
	bh=xQmO7EJXl1PoTtMOtJVG6NGd02VYJTyAaCn3EEcWWss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=etwMqJpS5Ue2xjTIBn/Rrmg0rM3uZ2gmq2jbeysyst1MP7bEAdtOty+h/MGQR6hCv
	 Kg/Z4iUATK8JJBGSA+mBU/S9NNkJMqGUIaLn1zQbR5HeMdet2DEvDXlu+p+Hn3YnIB
	 Y0qZ3v027cRBo5GjYoxAEJH4dETv9Om379JWp0WrQ8Mg/1GndcZpLUBFRr0SECBKKm
	 cKI+keWWgRGAynfHL+0mlC2zBXZeZUaDS5G2MPFpzJpCyZ+nBMGqbbhKVJMRPNR21K
	 3LaamZ0vWgZZoWDJII9cMgixGcEytoC1WbsjKV+ILkNbIhEa4z+ZCPClkyQTvO10Pa
	 lujBpsu7X7ARw==
Date: Wed, 25 Mar 2026 09:49:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jingyuan Liang <jingyliang@chromium.org>
Cc: Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mark Brown <broonie@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, hbarnor@chromium.org, 
	tfiga@chromium.org, Jarrett Schultz <jaschultz@microsoft.com>, 
	Dmitry Antipov <dmanti@microsoft.com>, Angela Czubak <acz@semihalf.com>
Subject: Re: [PATCH v2 00/11] Add spi-hid transport driver
Message-ID: <20260325-naughty-hungry-wapiti-658e83@quoll>
References: <20260324-send-upstream-v2-0-521ce8afff86@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324-send-upstream-v2-0-521ce8afff86@chromium.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-81166-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,goodmis.org,efficios.com,gmail.com,vger.kernel.org,chromium.org,microsoft.com,semihalf.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7B23D3219C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 06:39:33AM +0000, Jingyuan Liang wrote:
> This series picks up the spi-hid driver work originally started by
> Microsoft. The patch breakdown has been modified and the implementation
> has been refactored to address upstream feedback and testing issues. We
> are submitting this as a new series while keeping the original sign-off
> chain to reflect the history.
> 
> Same as the original series, there is a change to HID documentation, some
> HID core changes to support a SPI device, the SPI HID transport driver,
> and HID over SPI Device Tree binding. We have added the HID over SPI ACPI
> support, power management, panel follower, and quirks for Ilitek touch
> controllers.
> 
> Original authors: Jarrett Schultz <jaschultz@microsoft.com>,
> 		  Dmitry Antipov <dmanti@microsoft.com>
> Link: https://lore.kernel.org/r/86b63b7b-afda-d7f4-7bfa-175085d5a8ef@gmail.com
> 
> Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
> ---
> Changes in v2:
> - Fix style problems and remove unnecessary fields from the DT binding file

Style and removal? So other comments were skipped?

Please write detailed changelogs, otherwise it feels you just ignore
parts of the feedback.

Best regards,
Krzysztof


