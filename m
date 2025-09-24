Return-Path: <linux-doc+bounces-61672-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5351B99BBC
	for <lists+linux-doc@lfdr.de>; Wed, 24 Sep 2025 14:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF65C3261C1
	for <lists+linux-doc@lfdr.de>; Wed, 24 Sep 2025 12:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1063F306B0D;
	Wed, 24 Sep 2025 12:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAZMVh/2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73700305966
	for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758715268; cv=none; b=NN950i95SV6rb4sILHRJI9OuLNaLXsRcceCtbmrsxf1We16C41MWEY5lsnGCqIYT27mhg7qLBZS/7K5imA+KvrzHwVosmvSo/LOM8j+56vukmyZmmMZtCSrojJO3ajW4Yj+hrGACZtQTswj/JnafSqXAmZmKu4VV63eqm+IrWLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758715268; c=relaxed/simple;
	bh=1x1tZkclSlUAFkeAbCTbg9ur9vKYhrQAjAn0c+iWPHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BG7PPD9SapqKwxUTAgLRp3D+rUr6liP93f+ZAgZrrA1WF4Pyq2NZ4I19HAgXNCHbrm4hW6Rtlm2IzjtkgjwKMn0tHg03dl4lmnBkcm5ucouU8x4Ti1tT9TwNBk0s/Y5m7uYxmzBdxx6HS0nZoNvTbBrdC19uB7CTHp5SDl5q+Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAZMVh/2; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-271d1305ad7so49147845ad.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Sep 2025 05:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758715262; x=1759320062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dXdR7Vr7GvNxroOAYy+aBhMqtIGh2YpUvjEzBf0MIg=;
        b=HAZMVh/2JYtZudMoe4XXzvbN8cfJTp+1ewB3T/14JMdxAMmQUdV1sAPK4EhX5456pA
         IJbDNXECjuz/otNjpvs39d1j3CcW3fWdwS76EkMnVuFa2VpJvSTbr/RsqnyuQxdSTxtj
         dhy4qdtGkSJXzSTsgKrItD4dIzVmPmhcmXlHLcmQJwdad08oBW/pwZb9cj4ySnrJrQ3Y
         EGyi0PL6oDC9i++W3JJ8HBzXDll0vzf0iyZuzMzN7QHw69E9EpzSm0FAmi2tpOvhGgCH
         hBR4czKYJO+nVjr22x9NKy445yHJFosrRrF/jYzNWRXvyaL560zJFYv0dKiKUTMyUV3I
         umvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758715262; x=1759320062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6dXdR7Vr7GvNxroOAYy+aBhMqtIGh2YpUvjEzBf0MIg=;
        b=RVgZn31/9mw5D3CJZIAw4xlTk/1EW1kJoRbzvni9VxhxKK+OYWFYFd69mqxbxASaIP
         Rl1ZJH3KoG0kCNvy68WYmeVm2jXUdHR6Ca65jb3VGqPGeUUaxWAPWSYK/omwV/TIiff+
         O0yX1OqaW0gQ4/l5gCtKQ3xO78e8UlA0OT0VhAC02k1DsZuheemBi4JpRXxfC0a6K6U4
         K4CUq6rJXb2i53kTuPjIZ+7Qr7zNHM1J/zydwjaRQWZkFWdfMWOMseA7eauo9fgJRS7j
         m7kXowiVjCPEXKA/Fmtvmf94rRCq5uT0Uoei+QWhTJbYd7AwalaY0tQMOdcKSkepLDAK
         DNzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTOBwK6yE/2VRFZpHHIUE9Lgh9bz4XJqRT6gjJmjyhj9wOocMp/kO7SGGRBU5U3sKzEs2KAv2EjD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKQcVvO0nULl/eN1a6OB2BBpNPp0AlzAzCYuuE194Cy4Qkf4FU
	MXnd4+8Yik3vYgbMzceycYa3K1AFaT5uzl8kzRW+PG7kk1XznJpI1Yuw
X-Gm-Gg: ASbGncu1mCCFP8biJWE99t2vZwCgzIIVC3uvQdbJegFAs7UAYug6VlxmBQp7f4Jncnm
	hePnwLg2r2HamajDTEoC5WYx8tlFM8LMPs1WrneZCp+TzlNx/yPbGQ8jgzMCi6oCl6AJj66Qz44
	WE7iDKUw5hDNrcylLkT7IMjh9T9Q86N0IWIc5SkTpJCHVoc4vIAPq9Fk4hzXPiseakPz4sK5l8u
	neGV21AK2qdspl+bQkXGnA0QZIiEh2p6l/NKPrehtEShYmW8gPnCsmNX6D3+5hPubZYkKRSV2di
	3ENrXESHkem77Edccj6cqHRmCovb+0mvrJdm9fsi/TzGDl0P3Uvwv0qL+OpjxFzMRsQQjEPL3oD
	oNQMMy15BAi44B37ISzDXv94=
X-Google-Smtp-Source: AGHT+IGVP919XNHolLvfLc++BjiI5XDU3e+i/BPRLdij8Ir9EMWggkhD6kjR2mYU+aqH5NAU4i53wQ==
X-Received: by 2002:a17:903:2450:b0:268:f83a:835a with SMTP id d9443c01a7336-27cc9a91248mr60333305ad.60.1758715261649;
        Wed, 24 Sep 2025 05:01:01 -0700 (PDT)
Received: from localhost ([103.88.46.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26980053d25sm191276975ad.12.2025.09.24.05.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 05:01:01 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Rong Xu <xur@google.com>,
	Naveen N Rao <naveen@kernel.org>,
	David Kaplan <david.kaplan@amd.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Nam Cao <namcao@linutronix.de>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	"David S. Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org
Cc: Jinchao Wang <wangjinchao600@gmail.com>
Subject: [PATCH v5 23/23] MAINTAINERS: add entry for KStackWatch
Date: Wed, 24 Sep 2025 19:59:29 +0800
Message-ID: <20250924115931.197077-8-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924115931.197077-1-wangjinchao600@gmail.com>
References: <20250924115124.194940-1-wangjinchao600@gmail.com>
 <20250924115931.197077-1-wangjinchao600@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a maintainer entry for Kernel Stack Watch.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 520fb4e379a3..3d4811ff3631 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13362,6 +13362,14 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
 F:	Documentation/dev-tools/kselftest*
 F:	tools/testing/selftests/
 
+KERNEL STACK WATCH
+M:	Jinchao Wang <wangjinchao600@gmail.com>
+S:	Maintained
+F:	Documentation/dev-tools/kstackwatch.rst
+F:	include/linux/kstackwatch_types.h
+F:	mm/kstackwatch/
+F:	tools/kstackwatch/
+
 KERNEL SMB3 SERVER (KSMBD)
 M:	Namjae Jeon <linkinjeon@kernel.org>
 M:	Namjae Jeon <linkinjeon@samba.org>
-- 
2.43.0


