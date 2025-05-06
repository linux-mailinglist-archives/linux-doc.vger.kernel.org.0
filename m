Return-Path: <linux-doc+bounces-45414-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7138FAAC300
	for <lists+linux-doc@lfdr.de>; Tue,  6 May 2025 13:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF9C91C41A97
	for <lists+linux-doc@lfdr.de>; Tue,  6 May 2025 11:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 856F327E7D6;
	Tue,  6 May 2025 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="crSUsknM"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1CD27D789
	for <linux-doc@vger.kernel.org>; Tue,  6 May 2025 11:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746531768; cv=none; b=UOKnqbP+K9piiWsyIgEaVFF3PQGoVnhWqydVnoi36g2sNb3OZ4+OtcD6J3/4dOJcJDj//rnZumxMGsXDanjQnoqPtOFUaeJQ0qsDNgiC7ClkvJJ0VwqthJVBli9LxYPDsWRwH6bU2M1PHMBAcP+yzBzN6+v+uIYNziJ08jVVC8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746531768; c=relaxed/simple;
	bh=3jckaXXl4+Ky+GDtbuM6CpXXPW/56+PP5UQ6JOG1jhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KY7jdJs/BG4eNzTIMi8kIPo8snGdtA5jqJbyOdyQu42Gy8SKAj1Kk1O8m8oXc/NHH+VqtLdw18m8spnX/3mKcE21aQK+OjYzPWuEij1V4u70xnzYfEI2rwAJYDTvKo+YdwvRX+4gIcb49uvmFs0vEl5qjl6TPPdIDnTt7f8Al1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=crSUsknM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c0dfba946so4509296f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 06 May 2025 04:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531764; x=1747136564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYAEfE/9FBteAebOm2v05JfB5Qfap1wkkuURbt+yBIg=;
        b=crSUsknMRgXEV6SO6Sn2O+iV/KQl4A5RaFJ8OFGtRvgpSEfir5dFTe9IxPw+49T1BG
         E5LMSnjd6lCGO085aEHWwLRHzwai8fBwsCzr4sXvvfR6UX9pNZb0GTniFK0nuKGZXSAc
         yIfds1dasl49Lmud086utBJwetD44UylmH12wOzvBp43Hvh6Ga7bodG/FJew0NcOyw1G
         gPzbrlfwUNqmFtaiB6bq8kBKBRcIAWJUck9khUMN/FpCUiy5oiF2Ivgse2Ujzs3Ls/Cj
         9Hq2LyMMu6wzVXTKoIcFwIAPwoPgPq5mM80G7hJ0CHZZH4DSA9lpAY7fozJJun84eXNS
         AQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531764; x=1747136564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYAEfE/9FBteAebOm2v05JfB5Qfap1wkkuURbt+yBIg=;
        b=I135hJA/GHfFS8mlbQkrS9MQ9yVcOcKqAJyxSGG5b9x1XoaGO5hWtYATj5y/5oVOfY
         8wVNqOOACWmAnZd5/0znPOhKagxCHdiFO5nizbC02jpChAsb+VChDxiCWQXNJlNQYUPi
         e/xGGsEMioxzJY66HWKn3W1nDS3kNTS3mWeXlSqb8LR/jVubonCiAjqu40YK2YPqGels
         0tzvKjFYhyO1RSuFGKjOj1dVdqQqEBTcHexUprJoulk0/a3aD3+lcrwelwzBn9aByv9+
         J2HOG4mqKoytmgUUzyprPR5weKo/kO4lkQ+jxySjjMKtWs7GoUPOPaDQQfS6RCebmUGg
         jBgQ==
X-Forwarded-Encrypted: i=1; AJvYcCULJiuUP6Z1LgiNd5n1dScF/RYWSr9vVmBL9I/vgy6/cdICmTdjgkekxz8ZGUIemZ+UaWCBB4Jlan4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfZjDUK+/S+JFaqIJHw88LWfG6mIQwxUV72zZaQh8PBHlAMyHW
	vKme5p+wtuv1PkHhFOPbuxN5+E+JnyOn4pPn5ovgX8Ek7L61Bdqd73us1nhN6so=
X-Gm-Gg: ASbGnctPv1CnTMFi4gWT60IhBNwVqb/yTiO0e7p+jZ2AMCIYUuWlKKVQyb2AczjVFqX
	xPqh0NicAkI5k2Snzp6VYLDp/+m6sxdufW+44qN6hbHx9Lentk9qiv5N/UVbBhgCEiNPd7ky2ob
	6lm5mtKoRLimAWusi5xmFxq2D+LdC1upbWp2m98q2gtlNKyr69YWJfoCXL6o2NXS+zdez6kopYz
	XXRjrd6SFQMEDbLo9roAwQRLSuO55S1gihIWlld6ReaaK353Q1OLIS4ymdmzEon8wDQ2LfD+pSA
	Y4E7O87fLuFiW63DiZUVg/L1r8MLQFOGsFxCMPxcDmdxi4A=
X-Google-Smtp-Source: AGHT+IFQ2JTWwoxwIXrjoruUdsPwI8vW3JX1LtZAIkilV7YOBYnZOgxCGJbWEt0SH3QdtOoeDv42Tw==
X-Received: by 2002:a05:6000:2483:b0:39c:1257:c96c with SMTP id ffacd0b85a97d-3a0ac3ea5ebmr2296006f8f.56.1746531764463;
        Tue, 06 May 2025 04:42:44 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:44 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:41 +0100
Subject: [PATCH 09/10] perf tools: Add support for perf_event_attr::config4
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-9-dd480e8e4851@linaro.org>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0

perf_event_attr has gained a new field, config4, so add support for it
extending the existing configN support.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/tests/parse-events.c | 14 +++++++++++++-
 tools/perf/util/parse-events.c  | 11 +++++++++++
 tools/perf/util/parse-events.h  |  1 +
 tools/perf/util/parse-events.l  |  1 +
 tools/perf/util/pmu.c           |  8 ++++++++
 tools/perf/util/pmu.h           |  1 +
 6 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-events.c
index 5ec2e5607987..5f624a63d550 100644
--- a/tools/perf/tests/parse-events.c
+++ b/tools/perf/tests/parse-events.c
@@ -615,6 +615,8 @@ static int test__checkevent_pmu(struct evlist *evlist)
 	TEST_ASSERT_VAL("wrong config1",    1 == evsel->core.attr.config1);
 	TEST_ASSERT_VAL("wrong config2",    3 == evsel->core.attr.config2);
 	TEST_ASSERT_VAL("wrong config3",    0 == evsel->core.attr.config3);
+	TEST_ASSERT_VAL("wrong config4",    0 == evsel->core.attr.config4);
+
 	/*
 	 * The period value gets configured within evlist__config,
 	 * while this test executes only parse events method.
@@ -637,6 +639,7 @@ static int test__checkevent_list(struct evlist *evlist)
 		TEST_ASSERT_VAL("wrong config1", 0 == evsel->core.attr.config1);
 		TEST_ASSERT_VAL("wrong config2", 0 == evsel->core.attr.config2);
 		TEST_ASSERT_VAL("wrong config3", 0 == evsel->core.attr.config3);
+		TEST_ASSERT_VAL("wrong config4", 0 == evsel->core.attr.config4);
 		TEST_ASSERT_VAL("wrong exclude_user", !evsel->core.attr.exclude_user);
 		TEST_ASSERT_VAL("wrong exclude_kernel", !evsel->core.attr.exclude_kernel);
 		TEST_ASSERT_VAL("wrong exclude_hv", !evsel->core.attr.exclude_hv);
@@ -813,6 +816,15 @@ static int test__checkterms_simple(struct parse_events_terms *terms)
 	TEST_ASSERT_VAL("wrong val", term->val.num == 4);
 	TEST_ASSERT_VAL("wrong config", !strcmp(term->config, "config3"));
 
+	/* config4=5 */
+	term = list_entry(term->list.next, struct parse_events_term, list);
+	TEST_ASSERT_VAL("wrong type term",
+			term->type_term == PARSE_EVENTS__TERM_TYPE_CONFIG4);
+	TEST_ASSERT_VAL("wrong type val",
+			term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
+	TEST_ASSERT_VAL("wrong val", term->val.num == 5);
+	TEST_ASSERT_VAL("wrong config", !strcmp(term->config, "config4"));
+
 	/* umask=1*/
 	term = list_entry(term->list.next, struct parse_events_term, list);
 	TEST_ASSERT_VAL("wrong type term",
@@ -2451,7 +2463,7 @@ struct terms_test {
 
 static const struct terms_test test__terms[] = {
 	[0] = {
-		.str   = "config=10,config1,config2=3,config3=4,umask=1,read,r0xead",
+		.str   = "config=10,config1,config2=3,config3=4,config4=5,umask=1,read,r0xead",
 		.check = test__checkterms_simple,
 	},
 };
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 5152fd5a6ead..7e37f91e7b49 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -247,6 +247,8 @@ __add_event(struct list_head *list, int *idx,
 					      PERF_PMU_FORMAT_VALUE_CONFIG2, "config2");
 		perf_pmu__warn_invalid_config(pmu, attr->config3, name,
 					      PERF_PMU_FORMAT_VALUE_CONFIG3, "config3");
+		perf_pmu__warn_invalid_config(pmu, attr->config4, name,
+					      PERF_PMU_FORMAT_VALUE_CONFIG4, "config4");
 	}
 	if (init_attr)
 		event_attr_init(attr);
@@ -783,6 +785,7 @@ const char *parse_events__term_type_str(enum parse_events__term_type term_type)
 		[PARSE_EVENTS__TERM_TYPE_CONFIG1]		= "config1",
 		[PARSE_EVENTS__TERM_TYPE_CONFIG2]		= "config2",
 		[PARSE_EVENTS__TERM_TYPE_CONFIG3]		= "config3",
+		[PARSE_EVENTS__TERM_TYPE_CONFIG4]		= "config4",
 		[PARSE_EVENTS__TERM_TYPE_NAME]			= "name",
 		[PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD]		= "period",
 		[PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ]		= "freq",
@@ -830,6 +833,7 @@ config_term_avail(enum parse_events__term_type term_type, struct parse_events_er
 	case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 	case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 	case PARSE_EVENTS__TERM_TYPE_CONFIG3:
+	case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 	case PARSE_EVENTS__TERM_TYPE_NAME:
 	case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
 	case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
@@ -898,6 +902,10 @@ do {									   \
 		CHECK_TYPE_VAL(NUM);
 		attr->config3 = term->val.num;
 		break;
+	case PARSE_EVENTS__TERM_TYPE_CONFIG4:
+		CHECK_TYPE_VAL(NUM);
+		attr->config4 = term->val.num;
+		break;
 	case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
 		CHECK_TYPE_VAL(NUM);
 		break;
@@ -1097,6 +1105,7 @@ static int config_term_tracepoint(struct perf_event_attr *attr,
 	case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 	case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 	case PARSE_EVENTS__TERM_TYPE_CONFIG3:
+	case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 	case PARSE_EVENTS__TERM_TYPE_NAME:
 	case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
 	case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
@@ -1237,6 +1246,7 @@ do {								\
 		case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 		case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 		case PARSE_EVENTS__TERM_TYPE_CONFIG3:
+		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 		case PARSE_EVENTS__TERM_TYPE_NAME:
 		case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
 		case PARSE_EVENTS__TERM_TYPE_RAW:
@@ -1274,6 +1284,7 @@ static int get_config_chgs(struct perf_pmu *pmu, struct parse_events_terms *head
 		case PARSE_EVENTS__TERM_TYPE_CONFIG1:
 		case PARSE_EVENTS__TERM_TYPE_CONFIG2:
 		case PARSE_EVENTS__TERM_TYPE_CONFIG3:
+		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
 		case PARSE_EVENTS__TERM_TYPE_NAME:
 		case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
 		case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index e176a34ab088..6e90c26066d4 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -58,6 +58,7 @@ enum parse_events__term_type {
 	PARSE_EVENTS__TERM_TYPE_CONFIG1,
 	PARSE_EVENTS__TERM_TYPE_CONFIG2,
 	PARSE_EVENTS__TERM_TYPE_CONFIG3,
+	PARSE_EVENTS__TERM_TYPE_CONFIG4,
 	PARSE_EVENTS__TERM_TYPE_NAME,
 	PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD,
 	PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ,
diff --git a/tools/perf/util/parse-events.l b/tools/perf/util/parse-events.l
index 7ed86e3e34e3..8e2986d55bc4 100644
--- a/tools/perf/util/parse-events.l
+++ b/tools/perf/util/parse-events.l
@@ -317,6 +317,7 @@ config			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG); }
 config1			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG1); }
 config2			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG2); }
 config3			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG3); }
+config4			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_CONFIG4); }
 name			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_NAME); }
 period			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD); }
 freq			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ); }
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index b7ebac5ab1d1..fc50df65d540 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -1427,6 +1427,10 @@ static int pmu_config_term(const struct perf_pmu *pmu,
 			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
 			pmu_format_value(bits, term->val.num, &attr->config3, zero);
 			break;
+		case PARSE_EVENTS__TERM_TYPE_CONFIG4:
+			assert(term->type_val == PARSE_EVENTS__TERM_TYPE_NUM);
+			pmu_format_value(bits, term->val.num, &attr->config4, zero);
+			break;
 		case PARSE_EVENTS__TERM_TYPE_USER: /* Not hardcoded. */
 			return -EINVAL;
 		case PARSE_EVENTS__TERM_TYPE_NAME ... PARSE_EVENTS__TERM_TYPE_HARDWARE:
@@ -1474,6 +1478,9 @@ static int pmu_config_term(const struct perf_pmu *pmu,
 	case PERF_PMU_FORMAT_VALUE_CONFIG3:
 		vp = &attr->config3;
 		break;
+	case PERF_PMU_FORMAT_VALUE_CONFIG4:
+		vp = &attr->config4;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -1787,6 +1794,7 @@ int perf_pmu__for_each_format(struct perf_pmu *pmu, void *state, pmu_format_call
 		"config1=0..0xffffffffffffffff",
 		"config2=0..0xffffffffffffffff",
 		"config3=0..0xffffffffffffffff",
+		"config4=0..0xffffffffffffffff",
 		"name=string",
 		"period=number",
 		"freq=number",
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index b93014cc3670..1ce5377935db 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -22,6 +22,7 @@ enum {
 	PERF_PMU_FORMAT_VALUE_CONFIG1,
 	PERF_PMU_FORMAT_VALUE_CONFIG2,
 	PERF_PMU_FORMAT_VALUE_CONFIG3,
+	PERF_PMU_FORMAT_VALUE_CONFIG4,
 	PERF_PMU_FORMAT_VALUE_CONFIG_END,
 };
 

-- 
2.34.1


