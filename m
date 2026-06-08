Return-Path: <linux-doc+bounces-91493-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eYFhMDVAJ2r0twIAu9opvQ
	(envelope-from <linux-doc+bounces-91493-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 00:20:37 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5661F65AEF5
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 00:20:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ZLbqrydL;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91493-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91493-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AA363011C7C
	for <lists+linux-doc@lfdr.de>; Mon,  8 Jun 2026 22:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5AC3B14AD;
	Mon,  8 Jun 2026 22:16:24 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C4B28B4E2;
	Mon,  8 Jun 2026 22:16:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956984; cv=none; b=r57ibNYa0rixYuUu9o4MnUiLG+4U/OBAvx+PKLfpgWw1CKKeKn36DoNpPW+rqoiNYvjGWcQB0XZdQI8HGoOumjpAqVcmHiR0/+OeiK+ISrxNp143zpJ8j8u3pewn+vxmC/Ywy8lN09OBfzQtSnIZnj3h9y8EyKu0JYbB7EedPxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956984; c=relaxed/simple;
	bh=DDeO704qEU0EQ7Hlae5DWAs8z0G55TJg/i7FGO7u500=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=n+7G2wC6YGl9e7OXiIYc3ZVOlTf1jG3viRJAQFL2p+AujmdK8uaKCRG/6by5KCRzmaubBDpuF0vz3dH8keEwnY5UArCDVORZXZm1WXXsW6EtRXb/pxr2QQKEFOVueLR4S9zbSN1dUF9a2JWSFtPUws+A6702ZWnz7f78liAKM+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZLbqrydL; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B047A1F00893;
	Mon,  8 Jun 2026 22:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780956983;
	bh=s3x5kdRepi1J7M2cEklCCm2sZSMg7DeC+hQ4uJgl+jo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=ZLbqrydL7uyVtFWzj+G/HXsf6Sz2tjT7ZGEGgMUDd6H07Gcz5KOZ0rkOR9SUuGpMf
	 KUH0jpIikh9r5wEV+cMU2AtHmfmjXOkNUrhQG3lbI78brINcYV+RX5lunaFFgeMdzA
	 2f0TIi3VeS4lHUxE1kpeVtdA2KXX4BC7HemIGdtTPAdoT684mUe4/ET1KCVAd039Ax
	 9wAn/nDnK/rWEiXfQwgez5TprRHKpTADfNPsp7hqbGS9T8wM2PEtiUW3e4z2oJD80u
	 0VERCKS2tDxSPFMfAekh/YB0Hw4UmBvQjDKdpcIiRrVofwwiRND1Z+iTkhkTN9VPeB
	 OlYVhEWVBecvw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 00:16:15 +0200
Message-Id: <DJ40K3IBQUBY.EAMZAFC3091I@kernel.org>
Subject: Re: [PATCH v5 0/4] Enable sysfs module symlink for more built-in
 drivers
Cc: "Suzuki K Poulose" <suzuki.poulose@arm.com>, "James Clark"
 <james.clark@linaro.org>, "Alexander Shishkin"
 <alexander.shishkin@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Petr Pavlu" <petr.pavlu@suse.com>, "Daniel Gomez"
 <da.gomez@kernel.org>, "Sami Tolvanen" <samitolvanen@google.com>, "Aaron
 Tomlin" <atomlin@atomlin.com>, "Mike Leach" <mike.leach@arm.com>, "Leo Yan"
 <leo.yan@arm.com>, "Thierry Reding" <thierry.reding@kernel.org>, "Jonathan
 Hunter" <jonathanh@nvidia.com>, "Rahul Bukte" <rahul.bukte@sony.com>,
 <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Daniel
 Palmer" <daniel.palmer@sony.com>, "Tim Bird" <tim.bird@sony.com>,
 <linux-modules@vger.kernel.org>, <linux-tegra@vger.kernel.org>, "Sumit
 Gupta" <sumitg@nvidia.com>
To: "Shashank Balaji" <shashank.mahadasyam@sony.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
In-Reply-To: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91493-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:james.clark@linaro.org,m:alexander.shishkin@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:mike.leach@arm.com,m:leo.yan@arm.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:rahul.bukte@sony.com,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:driver-core@lists.linux.dev,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:daniel.palmer@sony.com,m:tim.bird@sony.com,m:linux-modules@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:sumitg@nvidia.com,m:shashank.mahadasyam@sony.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[arm.com,linaro.org,linux.intel.com,linuxfoundation.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,suse.com,atomlin.com,nvidia.com,sony.com,vger.kernel.org,lists.linaro.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[37];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5661F65AEF5

On Mon May 18, 2026 at 12:19 PM CEST, Shashank Balaji wrote:
> Shashank Balaji (4):
>       soc/tegra: cbb: Move driver registration from pure_initcall to core=
_initcall
>       kernel: param: initialize module_kset in a pure_initcall
>       coresight: pass THIS_MODULE implicitly through a macro
>       driver core: platform: set mod_name in driver registration

Picking this up now, so it can still make it for 7.2-rc1 and get some time =
in
linux-next.

Suzuki, since I haven't heard back I figured it should be fine to also pick=
 the
coresight change as it is purely mechanic and driver-core motivated, but pl=
ease
let me know if you have any concerns.

Thanks,
Danilo

