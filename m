Return-Path: <linux-doc+bounces-93952-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iS2ZBshEQmoT3QkAu9opvQ
	(envelope-from <linux-doc+bounces-93952-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 12:11:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7686D8BCC
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 12:11:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chaosmail.tech header.s=mail header.b=Fc+UwHQQ;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-93952-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-93952-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=chaosmail.tech;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 114E0301518C
	for <lists+linux-doc@lfdr.de>; Mon, 29 Jun 2026 09:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5273F392C2A;
	Mon, 29 Jun 2026 09:55:12 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042A33368A4;
	Mon, 29 Jun 2026 09:55:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726912; cv=none; b=YlVv4sL1W0XuO6SlAM8JmXJo08ByE8ZxxwkunQG7zKdPQ4LcOg6VNNvpyLjKAfXYtopfBkuQvb5qyS4Hm5GwF87epGTKRCu2Xq0X40+cgldSYW4RHD0bb1RY3e9qXpD5ucAPYZIRvbmuuk/CK6futXV2txbZzHesNHkn9JrIrx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726912; c=relaxed/simple;
	bh=f3q6bXn0NIBEAK6I0Ih2vsMbY0Bsy5W2xdS5eAuynWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EvS+LVlJ11vk6CZxzCZv+lq6mE60dZKxLRHr7326ES2ljqPMeZDAQ6nC6i7s6hk2zJqD4jAmeh0HmF5Nt5wTvDKNoiBuP8o7wdiVKl0jfFTc6CibRzd3I+DAUsXBJAt+rSl+KJxnTfVvxkVpmx47WTx0wOEYwKjBwZOLJEoHGvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=Fc+UwHQQ; arc=none smtp.client-ip=77.81.229.115
Received: by chaosmail.tech (Postfix) id B14E41CB983;
	Mon, 29 Jun 2026 09:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1782726909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+YzvGyIZGWqJterH6R4RynhALjA6a9xiCLrxLVoeC4w=;
	b=Fc+UwHQQo2NxWjgRzvGxl1QIgMQD7BScXQiePANR2JeABG3vvVJAUHo3VDIRWKUNVgmTGz
	Upf2PwJEqYTgl6+cff5D95qVmmbpB4QIWDjM3wNgqnXYZP+2mKMHZJb8XBuvkV51SYCi6O
	UDxw+Pxu4KZm2dOG/VYC16O1xP3RSrs=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Mon, 29 Jun 2026 11:54:48 +0200
Subject: [PATCH v3] Fail the build on RUST=y and RUST_IS_AVAILABLE=n
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-evolve-to-crab-v3-1-12829a7c536b@chaosmail.tech>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOTQ7CIBAF4KsY1mIA+4OuvIdxAcPUYmoxgETT9
 O5C3Zg0Ll/y5nszkYDeYiDHzUQ8JhusG3PYbzcEejVekVqTMxFMNKzmjGJyQ0IaHQWvNJWgFW8
 bacDUJB89PHb2tYDnyzeHp74hxKKURm9DdP69LCZeen/xxCmngknTyQqbVuMp/+TCXdlhFxF6U
 haS+DEEXxkiG8AlMjzIDupqZczz/AHzWsJiBwEAAA==
X-Change-ID: 20260510-evolve-to-crab-8cba1768dcd5
To: Alice Ryhl <aliceryhl@google.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Gary Guo <gary@garyguo.net>, Jonathan Corbet <corbet@lwn.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Neal Gompa <neal@gompa.dev>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782726908; l=2541;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=f3q6bXn0NIBEAK6I0Ih2vsMbY0Bsy5W2xdS5eAuynWw=;
 b=UH4AUJLl9RZp4/7YRw+22GJCRfeVpk+RpTcTKjUd2YB5tOiWepux8Gl31tsMfeCQB5uQomUeF
 xbl22mcpWyTAjPkHWO45udA3XkG62ptMjceKVN0JMChjVeMM17rfLM9
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chaosmail.tech,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[chaosmail.tech:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:a.hindborg@kernel.org,m:lossin@kernel.org,m:bjorn3_gh@protonmail.com,m:boqun@kernel.org,m:dakr@kernel.org,m:gary@garyguo.net,m:corbet@lwn.net,m:ojeda@kernel.org,m:skhan@linuxfoundation.org,m:tmgross@umich.edu,m:neal@gompa.dev,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:k@chaosmail.tech,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[k@chaosmail.tech,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-93952-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[google.com,kernel.org,protonmail.com,garyguo.net,lwn.net,linuxfoundation.org,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[k@chaosmail.tech,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[chaosmail.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,chaosmail.tech:dkim,chaosmail.tech:email,chaosmail.tech:mid,chaosmail.tech:from_mime,msgid.link:url,gompa.dev:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C7686D8BCC

The current approach of silently disabling all rust drivers if the
toolchain is missing results in users that try to compile their own
kernels getting a "successful" build and then being confused about where
did their drivers go. In comparison, missing openssl results in a build
failure, not a disappearance of everything that depends on it.

This also means that allyesconfig will depend on rust, but since the
rust experiment concluded with "rust is here to stay", i believe that
allyesconfig should be building rust drivers too.

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
Changes in v3:
- Collect r-b tags
- Rebase on 7.2
- Link to v2: https://patch.msgid.link/20260521-evolve-to-crab-v2-1-c18e0e98fc54@chaosmail.tech

Changes in v2:
- No longer a RFC, let's make it happen.
- Update the docs.
- Link to v1: https://patch.msgid.link/20260510-evolve-to-crab-v1-1-208df84e67be@chaosmail.tech
---
 Documentation/rust/quick-start.rst | 6 +++---
 init/Kconfig                       | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index a6ec3fa94d33..764c81d0dd59 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -321,9 +321,9 @@ Configuration
 -------------
 
 ``Rust support`` (``CONFIG_RUST``) needs to be enabled in the ``General setup``
-menu. The option is only shown if a suitable Rust toolchain is found (see
-above), as long as the other requirements are met. In turn, this will make
-visible the rest of options that depend on Rust.
+menu. In turn, this will make visible the rest of options that depend on Rust.
+You can check the value of ``RUST_IS_AVAILABLE`` to determine if your toolchain
+is configured correctly.
 
 Afterwards, go to::
 
diff --git a/init/Kconfig b/init/Kconfig
index 5230d4879b1c..0eca3dfd9349 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2207,7 +2207,6 @@ config PROFILING
 config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
-	depends on RUST_IS_AVAILABLE
 	select EXTENDED_MODVERSIONS if MODVERSIONS
 	depends on !MODVERSIONS || GENDWARFKSYMS
 	depends on !GCC_PLUGIN_RANDSTRUCT

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260510-evolve-to-crab-8cba1768dcd5

Best regards,
--  
Sasha Finkelstein <k@chaosmail.tech>


