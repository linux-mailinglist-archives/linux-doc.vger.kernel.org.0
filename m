Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1135174D1E7
	for <lists+linux-doc@lfdr.de>; Mon, 10 Jul 2023 11:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbjGJJkS (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 10 Jul 2023 05:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjGJJjZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jul 2023 05:39:25 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E01C2711;
        Mon, 10 Jul 2023 02:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688981824; x=1720517824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iGe+YwVNmPq1+zqO9UyiaCBbCGF6aB1MOiyT8TFuwhg=;
  b=rKEbVZi2+FAPAFm9HMgfOyY4+gnpmDVrPe3RKhFUcVxBboBGcRDHxHFp
   rVYeGwPH9YSwIfXKuFJW2AB1AQophoj6mwGs2RUcsqe/HBqkAiTg29kfm
   JXYcSOOykjxJJQadpMn2BDvbvjew7uFBWU0W1Zd9fZZ4I1Qb2F0KU3SRa
   24/c21Ke/RcNu3k/nGvXiTrtr1LEhsFH2o9jfWtXzrnl34nIzoQS3i1nT
   A+1L0I4LHc8W4DVi7LYk0oV0xNnTMm2QabJlSPVw+D2jljv1pgxjX5i9L
   q+DWIPfe4jM3g8s2iAevFw0kw+K9Tan8ag0R5lywSV577T8I34bUONcUk
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="222870079"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jul 2023 02:36:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 10 Jul 2023 02:36:51 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 10 Jul 2023 02:36:48 -0700
From:   Conor Dooley <conor.dooley@microchip.com>
To:     <palmer@dabbelt.com>
CC:     <conor@kernel.org>, <conor.dooley@microchip.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Andrew Jones <ajones@ventanamicro.com>,
        "Heiko Stuebner" <heiko.stuebner@vrull.eu>,
        Evan Green <evan@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 08/11] RISC-V: split riscv_fill_hwcap() in 3
Date:   Mon, 10 Jul 2023 10:35:43 +0100
Message-ID: <20230710-goatskin-thieving-a49e93cb9a7e@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230710-equipment-stained-dd042d66ba5d@wendy>
References: <20230710-equipment-stained-dd042d66ba5d@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11968; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=iGe+YwVNmPq1+zqO9UyiaCBbCGF6aB1MOiyT8TFuwhg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmrL9wo3pirwOm+UyWweEvGr0nHcjlZk1nW625lPJKtrWAt fm9FRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZio8jwTyU+aHHcbduzk1rYe5melG 6JUNA9udDGYaOH5tMW0/PhtYwM047zmvkem+w5VcvFYtr3877VX3a9thYV2Mhj939p5PLTDAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Before adding more complexity to it, split riscv_fill_hwcap() into 3
distinct sections:
- riscv_fill_hwcap() still is the top level function, into which the
  additional complexity will be added.
- riscv_fill_hwcap_from_isa_string() handles getting the information
  from the riscv,isa/ACPI equivalent across harts & the various quirks
  there
- riscv_parse_isa_string() does what it says on the tin.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- Drop unused variables
---
 arch/riscv/kernel/cpufeature.c | 345 +++++++++++++++++----------------
 1 file changed, 177 insertions(+), 168 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bf7e8e8852f0..41aedeaecb61 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -178,29 +178,172 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
 
-void __init riscv_fill_hwcap(void)
+static void __init riscv_parse_isa_string(unsigned long *this_hwcap, struct riscv_isainfo *isainfo,
+					  unsigned long *isa2hwcap, const char *isa)
+{
+	/*
+	 * For all possible cpus, we have already validated in
+	 * the boot process that they at least contain "rv" and
+	 * whichever of "32"/"64" this kernel supports, and so this
+	 * section can be skipped.
+	 */
+	isa += 4;
+
+	while (*isa) {
+		const char *ext = isa++;
+		const char *ext_end = isa;
+		bool ext_long = false, ext_err = false;
+
+		switch (*ext) {
+		case 's':
+			/*
+			 * Workaround for invalid single-letter 's' & 'u'(QEMU).
+			 * No need to set the bit in riscv_isa as 's' & 'u' are
+			 * not valid ISA extensions. It works until multi-letter
+			 * extension starting with "Su" appears.
+			 */
+			if (ext[-1] != '_' && ext[1] == 'u') {
+				++isa;
+				ext_err = true;
+				break;
+			}
+			fallthrough;
+		case 'S':
+		case 'x':
+		case 'X':
+		case 'z':
+		case 'Z':
+			/*
+			 * Before attempting to parse the extension itself, we find its end.
+			 * As multi-letter extensions must be split from other multi-letter
+			 * extensions with an "_", the end of a multi-letter extension will
+			 * either be the null character or the "_" at the start of the next
+			 * multi-letter extension.
+			 *
+			 * Next, as the extensions version is currently ignored, we
+			 * eliminate that portion. This is done by parsing backwards from
+			 * the end of the extension, removing any numbers. This may be a
+			 * major or minor number however, so the process is repeated if a
+			 * minor number was found.
+			 *
+			 * ext_end is intended to represent the first character *after* the
+			 * name portion of an extension, but will be decremented to the last
+			 * character itself while eliminating the extensions version number.
+			 * A simple re-increment solves this problem.
+			 */
+			ext_long = true;
+			for (; *isa && *isa != '_'; ++isa)
+				if (unlikely(!isalnum(*isa)))
+					ext_err = true;
+
+			ext_end = isa;
+			if (unlikely(ext_err))
+				break;
+
+			if (!isdigit(ext_end[-1]))
+				break;
+
+			while (isdigit(*--ext_end))
+				;
+
+			if (tolower(ext_end[0]) != 'p' || !isdigit(ext_end[-1])) {
+				++ext_end;
+				break;
+			}
+
+			while (isdigit(*--ext_end))
+				;
+
+			++ext_end;
+			break;
+		default:
+			/*
+			 * Things are a little easier for single-letter extensions, as they
+			 * are parsed forwards.
+			 *
+			 * After checking that our starting position is valid, we need to
+			 * ensure that, when isa was incremented at the start of the loop,
+			 * that it arrived at the start of the next extension.
+			 *
+			 * If we are already on a non-digit, there is nothing to do. Either
+			 * we have a multi-letter extension's _, or the start of an
+			 * extension.
+			 *
+			 * Otherwise we have found the current extension's major version
+			 * number. Parse past it, and a subsequent p/minor version number
+			 * if present. The `p` extension must not appear immediately after
+			 * a number, so there is no fear of missing it.
+			 *
+			 */
+			if (unlikely(!isalpha(*ext))) {
+				ext_err = true;
+				break;
+			}
+
+			if (!isdigit(*isa))
+				break;
+
+			while (isdigit(*++isa))
+				;
+
+			if (tolower(*isa) != 'p')
+				break;
+
+			if (!isdigit(*++isa)) {
+				--isa;
+				break;
+			}
+
+			while (isdigit(*++isa))
+				;
+
+			break;
+		}
+
+		/*
+		 * The parser expects that at the start of an iteration isa points to the
+		 * first character of the next extension. As we stop parsing an extension
+		 * on meeting a non-alphanumeric character, an extra increment is needed
+		 * where the succeeding extension is a multi-letter prefixed with an "_".
+		 */
+		if (*isa == '_')
+			++isa;
+
+#define SET_ISA_EXT_MAP(name, bit)						\
+		do {								\
+			if ((ext_end - ext == sizeof(name) - 1) &&		\
+			     !strncasecmp(ext, name, sizeof(name) - 1) &&	\
+			     riscv_isa_extension_check(bit))			\
+				set_bit(bit, isainfo->isa);			\
+		} while (false)							\
+
+		if (unlikely(ext_err))
+			continue;
+		if (!ext_long) {
+			int nr = tolower(*ext) - 'a';
+
+			if (riscv_isa_extension_check(nr)) {
+				*this_hwcap |= isa2hwcap[nr];
+				set_bit(nr, isainfo->isa);
+			}
+		} else {
+			for (int i = 0; i < riscv_isa_ext_count; i++)
+				SET_ISA_EXT_MAP(riscv_isa_ext[i].name,
+						riscv_isa_ext[i].id);
+		}
+#undef SET_ISA_EXT_MAP
+	}
+}
+
+static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 {
 	struct device_node *node;
 	const char *isa;
-	char print_str[NUM_ALPHA_EXTS + 1];
-	int i, j, rc;
-	unsigned long isa2hwcap[26] = {0};
+	int rc;
 	struct acpi_table_header *rhct;
 	acpi_status status;
 	unsigned int cpu;
 
-	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
-	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
-	isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
-	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
-	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
-	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
-	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
-
-	elf_hwcap = 0;
-
-	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
-
 	if (!acpi_disabled) {
 		status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
 		if (ACPI_FAILURE(status))
@@ -232,158 +375,7 @@ void __init riscv_fill_hwcap(void)
 			}
 		}
 
-		/*
-		 * For all possible cpus, we have already validated in
-		 * the boot process that they at least contain "rv" and
-		 * whichever of "32"/"64" this kernel supports, and so this
-		 * section can be skipped.
-		 */
-		isa += 4;
-
-		while (*isa) {
-			const char *ext = isa++;
-			const char *ext_end = isa;
-			bool ext_long = false, ext_err = false;
-
-			switch (*ext) {
-			case 's':
-				/*
-				 * Workaround for invalid single-letter 's' & 'u'(QEMU).
-				 * No need to set the bit in riscv_isa as 's' & 'u' are
-				 * not valid ISA extensions. It works until multi-letter
-				 * extension starting with "Su" appears.
-				 */
-				if (ext[-1] != '_' && ext[1] == 'u') {
-					++isa;
-					ext_err = true;
-					break;
-				}
-				fallthrough;
-			case 'S':
-			case 'x':
-			case 'X':
-			case 'z':
-			case 'Z':
-				/*
-				 * Before attempting to parse the extension itself, we find its end.
-				 * As multi-letter extensions must be split from other multi-letter
-				 * extensions with an "_", the end of a multi-letter extension will
-				 * either be the null character or the "_" at the start of the next
-				 * multi-letter extension.
-				 *
-				 * Next, as the extensions version is currently ignored, we
-				 * eliminate that portion. This is done by parsing backwards from
-				 * the end of the extension, removing any numbers. This may be a
-				 * major or minor number however, so the process is repeated if a
-				 * minor number was found.
-				 *
-				 * ext_end is intended to represent the first character *after* the
-				 * name portion of an extension, but will be decremented to the last
-				 * character itself while eliminating the extensions version number.
-				 * A simple re-increment solves this problem.
-				 */
-				ext_long = true;
-				for (; *isa && *isa != '_'; ++isa)
-					if (unlikely(!isalnum(*isa)))
-						ext_err = true;
-
-				ext_end = isa;
-				if (unlikely(ext_err))
-					break;
-
-				if (!isdigit(ext_end[-1]))
-					break;
-
-				while (isdigit(*--ext_end))
-					;
-
-				if (tolower(ext_end[0]) != 'p' || !isdigit(ext_end[-1])) {
-					++ext_end;
-					break;
-				}
-
-				while (isdigit(*--ext_end))
-					;
-
-				++ext_end;
-				break;
-			default:
-				/*
-				 * Things are a little easier for single-letter extensions, as they
-				 * are parsed forwards.
-				 *
-				 * After checking that our starting position is valid, we need to
-				 * ensure that, when isa was incremented at the start of the loop,
-				 * that it arrived at the start of the next extension.
-				 *
-				 * If we are already on a non-digit, there is nothing to do. Either
-				 * we have a multi-letter extension's _, or the start of an
-				 * extension.
-				 *
-				 * Otherwise we have found the current extension's major version
-				 * number. Parse past it, and a subsequent p/minor version number
-				 * if present. The `p` extension must not appear immediately after
-				 * a number, so there is no fear of missing it.
-				 *
-				 */
-				if (unlikely(!isalpha(*ext))) {
-					ext_err = true;
-					break;
-				}
-
-				if (!isdigit(*isa))
-					break;
-
-				while (isdigit(*++isa))
-					;
-
-				if (tolower(*isa) != 'p')
-					break;
-
-				if (!isdigit(*++isa)) {
-					--isa;
-					break;
-				}
-
-				while (isdigit(*++isa))
-					;
-
-				break;
-			}
-
-			/*
-			 * The parser expects that at the start of an iteration isa points to the
-			 * first character of the next extension. As we stop parsing an extension
-			 * on meeting a non-alphanumeric character, an extra increment is needed
-			 * where the succeeding extension is a multi-letter prefixed with an "_".
-			 */
-			if (*isa == '_')
-				++isa;
-
-#define SET_ISA_EXT_MAP(name, bit)							\
-			do {								\
-				if ((ext_end - ext == sizeof(name) - 1) &&		\
-				     !strncasecmp(ext, name, sizeof(name) - 1) &&	\
-				     riscv_isa_extension_check(bit))			\
-					set_bit(bit, isainfo->isa);			\
-			} while (false)							\
-
-			if (unlikely(ext_err))
-				continue;
-			if (!ext_long) {
-				int nr = tolower(*ext) - 'a';
-
-				if (riscv_isa_extension_check(nr)) {
-					this_hwcap |= isa2hwcap[nr];
-					set_bit(nr, isainfo->isa);
-				}
-			} else {
-				for (int i = 0; i < riscv_isa_ext_count; i++)
-					SET_ISA_EXT_MAP(riscv_isa_ext[i].name,
-							riscv_isa_ext[i].id);
-			}
-#undef SET_ISA_EXT_MAP
-		}
+		riscv_parse_isa_string(&this_hwcap, isainfo, isa2hwcap, isa);
 
 		/*
 		 * Linux requires the following extensions, so we may as well
@@ -420,6 +412,23 @@ void __init riscv_fill_hwcap(void)
 
 	if (!acpi_disabled && rhct)
 		acpi_put_table((struct acpi_table_header *)rhct);
+}
+
+void __init riscv_fill_hwcap(void)
+{
+	char print_str[NUM_ALPHA_EXTS + 1];
+	int i, j;
+	unsigned long isa2hwcap[26] = {0};
+
+	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
+	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
+	isa2hwcap['a' - 'a'] = COMPAT_HWCAP_ISA_A;
+	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
+	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
+	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
+
+	riscv_fill_hwcap_from_isa_string(isa2hwcap);
 
 	/* We don't support systems with F but without D, so mask those out
 	 * here. */
-- 
2.40.1

