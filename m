Return-Path: <linux-doc+bounces-94742-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a8nDKkxdR2ovXAAAu9opvQ
	(envelope-from <linux-doc+bounces-94742-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 08:57:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 486266FF49A
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 08:57:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=c42UBbw2;
	dmarc=pass (policy=reject) header.from=google.com;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94742-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94742-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A314300A49A
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 06:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F7A388862;
	Fri,  3 Jul 2026 06:57:13 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3441D3876BD
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 06:57:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061833; cv=none; b=firydsjoqZ0jiV8n+9319zCmXt8oaQbl3jp6v3nWjR3JeNtxRwWYfRStg5bGFZk7YFIUbwg75mnb22uDV6Z3hk/zM+cxC6oB3CgvJATLnCu5O543v9TYJZlhJWLIDNrcN/ZCQcokbjsiVJuX5vlPWReXAEqg9SSHjxmNuH3GRus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061833; c=relaxed/simple;
	bh=nScf5netnt1NjDVQidgpbeNPyFsk+SnFXpkUx7OAXGA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RhUV+CB+hkNeatIZmwyVDX0+Stt4X/zVfp+/OiCoi+F3MRwtpFMxSXXQ/b6jD/5i3ixfvKEnczzLQxzUS+aIa4eXcl9B8DEDIGoGY6jBdXLFjjA+ZNYkMTnIxsXi0D7S3keJJHbwX1kBzwjC8Nt6Mcc/E6EbTAH+nLuwo9qBQcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c42UBbw2; arc=none smtp.client-ip=209.85.221.74
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-475e540a0ffso166461f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 23:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783061830; x=1783666630; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BhiXOxf+bZWI18LM0Dx3pOu8Mks9Sw1XqPANu+yyKx4=;
        b=c42UBbw2vIa1ioj39shj824X91NUhmLordhn71LW1QE4VyJ9fy0jvumI9eWCuw4Ov5
         L+kuway3F7nusP5czEpWDmH91089MjzQ/N2HbLLHkL6RJBDYkzr10pN+SDDCGNQoEk7U
         2I0wPY3WeY7gT8+x15q7PUQ/sP78AyTA2zoV0EtpvcaqjkJnVwMsHuAQiJmPC9i7b8RH
         twVKlD+oyroy8NtdofK8ivEv6gxFlXnbKvnd9PGJjnhK004xUjOxSMdDeQ9qvUicZxPB
         n42mKKjjkEXHdPJQWEIL0T39RFPufhkWRG4sL23LI8fkPPsRlt/Mj3pJq0nzPw1zbwxp
         3uEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061830; x=1783666630;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BhiXOxf+bZWI18LM0Dx3pOu8Mks9Sw1XqPANu+yyKx4=;
        b=SMbQlgo28GdwIRIOcsd0oxsf0uPBmKtSV4e2RK1nWnaLZ1dGuYhQgQrvLkD+XuND22
         dCIvnYVjOYv+TTi9hZtJ7XqUk1KFs5bBYwnWAQ8J5GQp0J7/NCWO+7i/MwctJ7XSI6XG
         qUdB3Ks4aH1tOFUDmkyvx3x53hZyRDB5UT6iJB85ezo1tJGFitwVgSkPq3uGSCKFthbd
         BphLyUrXgA7AMXGB8gJxXzsGEdS7liRVUEMj8D/olSaWVX50/CHrFoMCDQ6JSHgefQ2A
         PNuJ618WmYI8ZSZDx1gI0NLpvRg08rYFJMHzGLoFalV0IsUk3theWr7SF//2tcuiIOkO
         E3Pg==
X-Forwarded-Encrypted: i=1; AFNElJ/z+2bA7/oiTbTLag/or4myuS/SfHewQc76Ba1VTiW3PkSQEeuGh1Vnr81aueUJtcPNwR25hFnTj3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAcvBKUIED2NI6tcqSudbr1qNQqfMJg2lElH3uWucMTAM1Z3/o
	a1SHYk5oXIIM7n0A+6di9Vxei7ozpMokpPziPVzzMlydUL3yGK2HJMRdiPexrP6ffqOBxGtqiwD
	23HQiUeBDNPvbDUg2Lg==
X-Received: from wmdn10.prod.google.com ([2002:a05:600c:294a:b0:493:b4c4:536f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5010:b0:493:72d3:4a81 with SMTP id 5b1f17b1804b1-493c2b5161emr120210055e9.16.1783061830358;
 Thu, 02 Jul 2026 23:57:10 -0700 (PDT)
Date: Fri, 03 Jul 2026 06:57:00 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD1dR2oC/33PTU7DMBAF4KtUXjNoPM6fWXEPxMJ2xqkFrcFOL
 VCVu+OURYsasXxPmu9pziJzCpzF0+4sEpeQQzzW0D7shNub48QQxpoFIXVIUkPiQywMs8lvwKc
 wgtTcWETLbFnUs4/EPnxdyJfX35z481Tl+VruQ55j+r7MFrm2/ywUCRI0NtjhQB1j/zzFOL3zo
 4sHsWqFbgTqNwRaBaPdgGYgtt2doK5Ci1uCAgTqPZFXqnXk7oTmRqCtL5oqYO/s6JXxesA/wrI sPwkc0nyMAQAA
X-Change-Id: 20260219-remove-task-euid-19e4b00beebe
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1932; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=nScf5netnt1NjDVQidgpbeNPyFsk+SnFXpkUx7OAXGA=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqR11ApXczXX2Gek2J+6VC5z6Iuc4bHt3uT0qa3
 oQletGsubiJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCakddQAAKCRAEWL7uWMY5
 RnYREACES2fWRH58RUZ8ijCGO0nid0c3qD6986tFCKqRXA2+AKL/DwrN05zSGi/BGr1Q6p9VNLC
 z6yK0MiUwXmZICs5E4UOKWBAIsAtDmwK6LfhY0ipAnISJwL8AlheQOBdgzBInbzV2/NM0d1VbPw
 Z/xhGMZtUel0kUJ9DH+Im3mT9xj3TVGD/huCvsbo5sHHH6AI1MJFFJx2pqHErUgCO69nuGG6G4x
 CCoDwoPGAYVUfxXRylBKOxEzmkSlK75dvX9YicD+GFsFNSR38F2dNlzQdYSy6I2N91gfS94Notl
 8Kha95efuMsWSKFmKZeMRUlMFF+eWUNPOB1DNl1t5oY70wcYFefpj0ffrx8gcBs2n1bUNLTOClU
 2Ii1YcOEAGsbVxxTljxttKsCT6Q0x6yq+jHtegU1CzCcTcYxZTF/OkylwoZZPWeKH1+/lsqRnja
 BqRijzyxA/3M5azKjTLdMzERNVIwAddUiD+G7Z9EtzJGr2a72A3qbDXd3heu+5IbOJvgBK1uhRH
 wXuvvJagFdu7Q7Nihky8l4pWlgDEJtlMGIQ0w7wxAf2ai7dx+fZgmLuEE3hFfBJiMVcC2lRxrbD
 Dsq+YHG1CvpCCz+g9NRM6qGl0t9Zn7cM/cFc7Fxut8hEG9+5YmlPGyFBEG4QdZagSFBK0VAS4Oh R+wqLG+8mV38XTw==
X-Mailer: b4 0.14.3
Message-ID: <20260703-remove-task-euid-v5-0-c90c7e2ddf54@google.com>
Subject: [PATCH v5 0/2] Delete task_euid()
From: Alice Ryhl <aliceryhl@google.com>
To: Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-94742-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:paul@paul-moore.com,m:sergeh@kernel.org,m:corbet@lwn.net,m:gregkh@linuxfoundation.org,m:skhan@linuxfoundation.org,m:alexs@kernel.org,m:si.yanteng@linux.dev,m:dzm91@hust.edu.cn,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:jannh@google.com,m:linux-security-module@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:aliceryhl@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 486266FF49A

The task_euid() method is a very weird method, and Binder was the only
user. As of commit 65b672152289 ("binder: use current_euid() for
transaction sender identity") Binder doesn't use task_euid() anymore,
so we can delete this method.

My suggestion would be to merge this through the LSM tree.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v5:
- Rebase on v7.2-rc1.
- Reword patch 1 commit message to take into account that usage has now
  been removed from Binder.
- Pick up Gary's Reviewed-by.
- Link to v4: https://lore.kernel.org/r/20260529-remove-task-euid-v4-0-07cbdf3af980@google.com

Changes in v4:
- Reword 'euid' -> 'effective UID' in 'Kuid::current_euid()' docs.
- Link to v3: https://lore.kernel.org/r/20260507-remove-task-euid-v3-0-27f22f335c2c@google.com

Changes in v3:
- Include 'task' clarification commit in series.
- Rebase and resend.
- Link to v2: https://lore.kernel.org/r/20260227-remove-task-euid-v2-1-9a9c80a82eb6@google.com

Changes in v2:
- Update translation as per Alex Shi.
- Pick up Reviewed-by Gary.
- Update commit title to use cred: prefix.
- Link to v1: https://lore.kernel.org/r/20260219-remove-task-euid-v1-1-904060826e07@google.com

---
Alice Ryhl (1):
      cred: delete task_euid()

Jann Horn (1):
      rust: task: clarify comments on task UID accessors

 Documentation/security/credentials.rst                    |  6 ++----
 Documentation/translations/zh_CN/security/credentials.rst |  4 +---
 include/linux/cred.h                                      |  1 -
 rust/helpers/task.c                                       |  5 -----
 rust/kernel/task.rs                                       | 11 ++---------
 5 files changed, 5 insertions(+), 22 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260219-remove-task-euid-19e4b00beebe

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


