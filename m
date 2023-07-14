Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC3ED75355F
	for <lists+linux-doc@lfdr.de>; Fri, 14 Jul 2023 10:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235401AbjGNIrq (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 14 Jul 2023 04:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235633AbjGNIrh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jul 2023 04:47:37 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63562708
        for <linux-doc@vger.kernel.org>; Fri, 14 Jul 2023 01:47:34 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-51e5da802afso1958124a12.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Jul 2023 01:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689324453; x=1691916453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xfnzqz2i7m5w9zMzOs0RqunR9vvDiHlmabhYNl07DtU=;
        b=QRTexeIsaQuwzZmHHH1qWjMfaVgQohb1jM0TSX3h4pKx34oQYn6cbwXTCromOfGYcL
         Tta5/ZU3WfrIC8LZEwrhwIv6Fl5UViGAHoX4Z40wOK0wfmiDGYo6M1P6RYRh92tvEm1A
         lgjoNI1FK4t3XozduDsu/mzKG2HtaKxRew6IKwKC+SHAtHe2meEXKda8QekvCoagcIO6
         KTWXFl0cFonQ/GYkBq3XXft+Mu0GybbpwqYcmIi8CIbvPujfORGmzQPb5wgTdps6gVYC
         XOQqon7bQHYJpakPB9YpjonH7WCwfyozV/VhsVBrmvQZoqqXDWTApIdqBkRxZJmpK9Mo
         jkEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689324453; x=1691916453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xfnzqz2i7m5w9zMzOs0RqunR9vvDiHlmabhYNl07DtU=;
        b=hL6FP1FyttHCUNrUymjHfvSe5npXYkWjROi2W7Cu7XQZkcprWf/po+HjYvg8GYVoA1
         aLPS5wwoitYotFPKHXt+6lo9zP8hpHj2RSRcLM25J05xU+R6vecceE0LXWSwnb6tyu2e
         VV58SR2Ud8102ZUAPQN6mEsFI6lHMHys9hPKWlgxXjWfWoe8Yt8jqBg7gUTBgA1pZi0S
         ZZVFS6CmM1FUCKZ2o9cQmrZsc6pL5mG7TRTrC89LuaumHxpQex1q1CNXaiWwdGmEz65J
         YjTFk9wVnh5Vhte/GiAnZJBE9CICADBnjzt9uErLrKcSWG1QnXUmHBeK9quQXRf1vZY7
         7kLg==
X-Gm-Message-State: ABy/qLYNLSBHaQoyS0uxkzAV7K8i8Q3RvHhSeqWdnsCnJby4phNqdDia
        Gg8pqFd/8I+c2be2S1qF/j3nxg==
X-Google-Smtp-Source: APBJJlEuf4i2pzMRoEofkzTMljBMlpAzj4iNGEl1v3hbp1MIkjUaSwOo0LcuFm7jwuef4HKv2BzhmA==
X-Received: by 2002:aa7:d359:0:b0:51e:4bd6:ce4a with SMTP id m25-20020aa7d359000000b0051e4bd6ce4amr4058266edr.11.1689324453302;
        Fri, 14 Jul 2023 01:47:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w24-20020aa7cb58000000b0051e0f8aac74sm5480662edt.8.2023.07.14.01.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 01:47:32 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Nishanth Menon <nm@ti.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, workflows@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] MAINTAINER: samsung: document dtbs_check requirement for Samsung
Date:   Fri, 14 Jul 2023 10:47:25 +0200
Message-Id: <20230714084725.27847-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Samsung ARM/ARM64 SoCs (including legacy S3C64xx and S5PV210) are also
expected not to bring any new dtbs_check warnings.  In fact this have
been already enforced and tested since few release.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Previous idea was here:
https://lore.kernel.org/all/20230712084131.127982-1-krzysztof.kozlowski@linaro.org/
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7405fb6e38c3..9a539af4d775 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2632,6 +2632,7 @@ R:	Alim Akhtar <alim.akhtar@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+P:	Documentation/process/maintainer-soc-clean-dts.rst
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
 B:	mailto:linux-samsung-soc@vger.kernel.org
 C:	irc://irc.libera.chat/linux-exynos
-- 
2.34.1

