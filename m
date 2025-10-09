Return-Path: <linux-doc+bounces-62826-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A48BC8ACB
	for <lists+linux-doc@lfdr.de>; Thu, 09 Oct 2025 13:02:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4E2354F3E6D
	for <lists+linux-doc@lfdr.de>; Thu,  9 Oct 2025 11:02:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587672EC56F;
	Thu,  9 Oct 2025 10:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neiksZ1z"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A6D2EC080
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760007522; cv=none; b=BAbbyC3vm65N1LoWHJc032+z3UsSDQJd0CYLg7o7iTD7io7Yth/UwIS0fb5LfcDlmbq5icFLxRB9oSWheFkJBco2F13QdyEMtKMbZntS4XDZtOl3TQIolhfRpM7Nt8dOjU8pkhpNpY5U2G3BKK3bXXWTGlKPNFt1gGoWV1CIBj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760007522; c=relaxed/simple;
	bh=JE2O3gXCPzxmYnUAKlXgnSjWi6sqfl5NW64CDq3b/SU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TW+z2y/OPSnUaFhC1ldByOoQZ8En7meJMpAOIPXaiiUo2KeiYIAsHSwstK3KNA+D8SKupsURYEdiZxuOXS2E+LNnLtslqqyyLegUB4YfUWriYELy9GG7XoA50QUNBZ6kyXHBuyQHcLkPq4KBLYbIrUf2pSa392go3du1onKRD04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neiksZ1z; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77f5d497692so1022265b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 03:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760007520; x=1760612320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ApAR8xSadwKhwismNq+uPz91ksCPHZtzxjh6qDdbHI=;
        b=neiksZ1zocphckHCNdcqvCB0SEeovXjopGI6pfpT024hB9TvNjLbNBW2fKJWGPduwr
         GiSupT6G/yLKjBEtqqAeENNbRPdgnNYMqthN122C5+pJxCOkOQWV61nbV4w1No4FRyYT
         9g7DxBp3MRACp4vLb8XCW/2HHHgm5bx23ER9ozH7ZIeGtwfRIqwfncfD6BJPQ5NyKi1E
         Dzh9XGRvbkafQcDpkHjTfZE9vZOulFBQ/n2M24QNnDblwnATtnrubC6H9rY+1HNqoS+l
         PoUlGHQwpEkwR/1UpJLxl8LX14t+gP/LvsFdcPZctWanuRItuk1buoqPc1yuKN9qKZtL
         6DAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760007520; x=1760612320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ApAR8xSadwKhwismNq+uPz91ksCPHZtzxjh6qDdbHI=;
        b=emKMOaUNeFVjJbln2P7UM4Rm1coq13o/YkzwO3ouvpZq2NM2L6RHTmXJXrtzMUq0PI
         DiEJqTgwPCu6H+v+8iecEYNU6UXGA/riPaIcZ8CHssKrbTFPjOuLjb/Xnuz09+S8t7zn
         wt51ZqXIlMq9CRxQIZ8BBZoWK4t5DZ5+zXQBrcV5hYUdz4KV4xcNeI5vGBfMPzkmKt1Q
         DO5lbzWPPwJ2zZmj1i1DgCbjzCFHRnHo7mCoNF2D7pUrYljkZP/aBjTU+oZd9ok7sgy+
         av0ah2SA28eDmiDrP+RrSnnyxfwYWr7GUm/QBhKP3F83sHmUpHm63hI8v4zSKrmCdwqH
         yzOA==
X-Forwarded-Encrypted: i=1; AJvYcCVFtAxzal2rjVXraVCa+tXzdv3jYuHmstkCWx8f/bjlge7T5RU2QQz/ZWlV8zQJw3cGqcDMgP59irw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxenbjNp6Pu1k7k4HOfxckOB+HKf2+fhkV3ThAExl8GDq8jAvDI
	xRS+Hiw1OV0DBxD5fsKcjsvAiQdpsLnCRmLxurh2MP8AsZACQu/gmB2w
X-Gm-Gg: ASbGncuVP6y7OwytgLHU9C8QTmZ8x1v1l5jSd0dYzoeUOXZbadSyokpmRHHoch2Vfma
	r6xsBV9dzmwVACUJXABfi6Y2BYThVv1wuenQtQH2b2eRnvWNKHvveVjR/Pf++H75lccurEqtEwz
	qsSmzHS0783rkD6O7pjZHbzwg5igSLPhbBzKu2FFQyZYgNiMJzeIIAPWMiC3CE0kq/gtSSqK0Jj
	FJX12GA8KE9i2UuyPm9yPdBVeNQ2HoJNTx5fRE3wuneMuVAeE7SUobwI0MPByuCxL7OrhLQw/1p
	7DjVmE8A9ZxGDc3ZmqNfYjDJSCYolsphze69Szsqju02EfmFBkn/bo2NBoJwsgWYx3Sm5ex3jAT
	QOD6AU4sjFsbWzr5NW1p6lAc+G1BiqycDhVwtqDNVtVniXW/bvGbWRK7tuJHbRsK26PFTc1w=
X-Google-Smtp-Source: AGHT+IFNGlIpEHO7TMNSv14SEeeL37qmV4fa31y9HfqA5Z8RmIIJBkgU1nSNu4enoYA+m8tb63ySAw==
X-Received: by 2002:a05:6a21:6d99:b0:262:1ae0:1994 with SMTP id adf61e73a8af0-32da845e6c6mr9710336637.42.1760007519707;
        Thu, 09 Oct 2025 03:58:39 -0700 (PDT)
Received: from localhost ([45.142.165.62])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099d4d324sm21591393a12.27.2025.10.09.03.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 03:58:39 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Marco Elver <elver@google.com>,
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
Subject: [PATCH v7 23/23] MAINTAINERS: add entry for KStackWatch
Date: Thu,  9 Oct 2025 18:55:59 +0800
Message-ID: <20251009105650.168917-24-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251009105650.168917-1-wangjinchao600@gmail.com>
References: <20251009105650.168917-1-wangjinchao600@gmail.com>
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
index 3a27901781c2..d5e3b984e709 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13596,6 +13596,14 @@ F:	Documentation/filesystems/smb/ksmbd.rst
 F:	fs/smb/common/
 F:	fs/smb/server/
 
+KERNEL STACK WATCH
+M:	Jinchao Wang <wangjinchao600@gmail.com>
+S:	Maintained
+F:	Documentation/dev-tools/kstackwatch.rst
+F:	include/linux/kstackwatch_types.h
+F:	mm/kstackwatch/
+F:	tools/kstackwatch/
+
 KERNEL UNIT TESTING FRAMEWORK (KUnit)
 M:	Brendan Higgins <brendan.higgins@linux.dev>
 M:	David Gow <davidgow@google.com>
-- 
2.43.0


