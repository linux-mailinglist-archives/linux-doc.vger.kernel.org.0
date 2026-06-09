Return-Path: <linux-doc+bounces-91565-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VcapH3nuJ2qg5gIAu9opvQ
	(envelope-from <linux-doc+bounces-91565-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 12:44:09 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7266965F144
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 12:44:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ReKNvMcD;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91565-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91565-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 47A2930BF953
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 10:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B30D3F9F3B;
	Tue,  9 Jun 2026 10:29:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAE13F8244;
	Tue,  9 Jun 2026 10:29:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000952; cv=none; b=BQNCLGkzXyoxthS5fd/6M5P72aPgEyjw72QTwBXgvJ5ob0uLXkSi4mJTGCoeSb7UsIzE/9F+86lHTI7c9af8/KnQV1xDQqreBFsCVwXr3o3W5FweQCtjetk6eS7PWb81uL0LKg2M9629GD+WjCuCQwXVyryjH8SFJYEKBRLoA+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000952; c=relaxed/simple;
	bh=po2PVYBoQHn3TVJ3gPK9zEXZO2IncL6RJxbmazHAy8A=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=obgEcoWe5JLK72tBkl707jNtUQ/koN0cTFuwuqvE85J97EBa+AXKfOSQfDgzYdL6/x+rlV11APVD8rkd19lkfNfezBoP+F0lkIin9OjP3hn03pkJ5Eta630qDKh9fZkqbUeByeT4ObzrE2UO91OldPyvbDQb23G1yrSIBuoofQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ReKNvMcD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD1D1F00893;
	Tue,  9 Jun 2026 10:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781000950;
	bh=Tta0PE+TZa8mL2th0Lo4FOkqR6QU33gR5Ohh0rNcY3c=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=ReKNvMcDkiw28GD3JbvCn9EipMm3IlPfdSUWfJXpK9M22Lgm/K3GFU1SXdrhkXZEB
	 5SdM69gC2r+NC3WYCbCyPuR0cxz1XkIOUgt6duIDMczoeCJR/yUOxNMDc0ndy4j1bL
	 fhLRu560UpjLJ6CgASjX+dnsScqp81YH+hH9fCPxrUrbK58RdWMsNFEr7vDg5pBwVs
	 35L1XnVoIyEwFAMW+axHlLAzHFwSMNxKWj5/H++TRdC8TACW8rcVaZM5dRKOPOwprT
	 tAGhAihwORzRGf1hQKmxKcgbu/f1FfpH3ai4lC8Wc3KCMX/XVXkAO378gK1Np1FfBm
	 cwCv4PY4W2rgg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 12:29:02 +0200
Message-Id: <DJ4G55S28THG.21SSZK5PQQVGL@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v5 0/4] Enable sysfs module symlink for more built-in
 drivers
Cc: "Shashank Balaji" <shashank.mahadasyam@sony.com>, "James Clark"
 <james.clark@linaro.org>, "Alexander Shishkin"
 <alexander.shishkin@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
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
To: "Suzuki K Poulose" <suzuki.poulose@arm.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260608222448.1353773-1-dakr@kernel.org>
 <1c8e441a-6b33-465a-88f9-9552f346ae18@arm.com>
In-Reply-To: <1c8e441a-6b33-465a-88f9-9552f346ae18@arm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91565-lists,linux-doc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:shashank.mahadasyam@sony.com,m:james.clark@linaro.org,m:alexander.shishkin@linux.intel.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:samitolvanen@google.com,m:atomlin@atomlin.com,m:mike.leach@arm.com,m:leo.yan@arm.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:rahul.bukte@sony.com,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:driver-core@lists.linux.dev,m:rust-for-linux@vger.kernel.org,m:linux-doc@vger.kernel.org,m:daniel.palmer@sony.com,m:tim.bird@sony.com,m:linux-modules@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:sumitg@nvidia.com,m:suzuki.poulose@arm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[sony.com,linaro.org,linux.intel.com,linuxfoundation.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,lwn.net,suse.com,atomlin.com,arm.com,nvidia.com,vger.kernel.org,lists.linaro.org,lists.infradead.org,lists.linux.dev];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7266965F144

On Tue Jun 9, 2026 at 11:08 AM CEST, Suzuki K Poulose wrote:
> On 08/06/2026 23:24, Danilo Krummrich wrote:
>> On Mon, 18 May 2026 19:19:56 +0900, Shashank Balaji wrote:
>>> [PATCH v5 0/4] Enable sysfs module symlink for more built-in drivers
>>=20
>> Applied, thanks!
>>=20
>>    Branch: driver-core-testing
>>    Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/dri=
ver-core.git
>>=20
>> [1/4] soc/tegra: cbb: Move driver registration from pure_initcall to cor=
e_initcall
>>        commit: cd6e95e7ab29
>> [2/4] kernel: param: initialize module_kset in a pure_initcall
>>        commit: c82dfce47833
>> [3/4] coresight: pass THIS_MODULE implicitly through a macro
>>        commit: efc22b3f89a3
>> [4/4] driver core: platform: set mod_name in driver registration
>>        commit: a7a7dc5c46a0
>>=20
>> The patches will appear in the next linux-next integration (typically wi=
thin 24
>> hours on weekdays).
>>=20
>> The patches are in the driver-core-testing branch and will be promoted t=
o
>> driver-core-next after validation.
>
> Apologies, I missed your emails. I am fine with those, happy to fixup=20
> anything if the linux-next screams.

Thanks for confirming! I did a test merge with linux-next and an allmodconf=
ig
arm64 build before picking it up, so it should be fine.

Thanks,
Danilo

