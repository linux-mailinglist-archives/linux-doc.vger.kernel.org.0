Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42DC71B3148
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2020 22:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgDUUe6 (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 21 Apr 2020 16:34:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725850AbgDUUe5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Apr 2020 16:34:57 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9C3C0610D5
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2020 13:34:57 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id n16so7321994pgb.7
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2020 13:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zwuJuvskhxZ4Rrv0tr0IjFWkC6EB4CBrNAqM37bcwjM=;
        b=o6oWKjpbAQEbd9QhLij6Ofb69hT0fG352NXleflgAvTaWJxNqXigp0Ow3KhjDi8c3h
         l3jY6nkDndnAVPeqexd+AKMNlq8YZA6xZMNQmC6Blv+5BgjWlMAvych0CSN0rRfkjkW0
         vcjC0tVyyG1yjy6EDajwKtSQ8S++lw2FV3jz+fCnax8z4jmBYFGnK32tn2IUZ5vM8juV
         L5JWrN4ZWLu78UpdnHsIyxXJnLg1JOmrzEu4vSe21ygsAOi7yVFvmOT2i+1aLboIPVJh
         iAhpf80xkSyu3LuQ2vSROe/nvps1H1eVOzFUFcOQKIPwgxX9bJIwHEE99NU3fVRlMztn
         fmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zwuJuvskhxZ4Rrv0tr0IjFWkC6EB4CBrNAqM37bcwjM=;
        b=rfjm/67hLpctQU/1PEo0dcGbDmA9jry5AHlbZQAq19ieaHhPDN3HWEjLZo7FhqkLpI
         9GoMkwhA7XHurS3fz4bF4LptgUZHs80Fcx4a5VCpdp1YVNqqLI8fIRV/1m9SQrjZ4X99
         kWQhfOuC3nYjvgYB6PsnCtNBhcYQu1Ak7yEYuyA+IdMyvuIHra/cAbUfp+iN7RaPBVMJ
         P9nBP1+MqCeF15G1qvidIGu1o4xVwD9AEk0DoOEMYEc+xlY3EvIImGo8NVZ7Ly5yoi9O
         42NX3fpToCAWS9jAnXj3o45htTXUHTBqSB6+jHLftSrCGaqRdy6ymnHJETMZOw+CmP/5
         OHnA==
X-Gm-Message-State: AGi0PuYd9j1lpdXruAvb3kYE3uwLsLU9KM1PTeRo+MHh/eSHZ4jVamRG
        22qZFUBLNmEw5aaRflTZxFO3hNdOXcxGCQ==
X-Google-Smtp-Source: APiQypJE0Avw/ejGkERla6nINzpim7anwERK5Mm3FT0gc+8wPqbAAObpkPUfSvN9oTn3UReXXVHTuw==
X-Received: by 2002:a63:1c25:: with SMTP id c37mr23660716pgc.320.1587501297106;
        Tue, 21 Apr 2020 13:34:57 -0700 (PDT)
Received: from hermes.lan (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id l30sm3073901pgu.29.2020.04.21.13.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 13:34:55 -0700 (PDT)
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     netdev@vger.kernel.org
Cc:     linux-doc@vger.kernel.org,
        Stephen Hemminger <stephen@networkplumber.org>
Subject: [PATCH] Documentation: add documentation of ping_group_range
Date:   Tue, 21 Apr 2020 13:34:48 -0700
Message-Id: <20200421203448.17937-1-stephen@networkplumber.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Support for non-root users to send ICMP ECHO requests was added
back in Linux 3.0 kernel, but the documentation for the sysctl
to enable it has been missing.

Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
---
 Documentation/networking/ip-sysctl.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.txt b/Documentation/networking/ip-sysctl.txt
index 6fcfd313dbe4..9375324aa8e1 100644
--- a/Documentation/networking/ip-sysctl.txt
+++ b/Documentation/networking/ip-sysctl.txt
@@ -983,6 +983,13 @@ ip_early_demux - BOOLEAN
 	reduces overall throughput, in such case you should disable it.
 	Default: 1
 
+ping_group_range - 2 INTEGERS
+	Restrict ICMP_PROTO datagram sockets to users in the group range.
+	The default is "1 0", meaning, that nobody (not even root) may
+	create ping sockets.  Setting it to "100 100" would grant permissions
+	to the single group. "0 4294967295" would enable it for the world, "100
+	4294967295" would enable it for the users, but not daemons.
+
 tcp_early_demux - BOOLEAN
 	Enable early demux for established TCP sockets.
 	Default: 1
-- 
2.20.1

