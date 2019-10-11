Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90DD1D4846
	for <lists+linux-doc@lfdr.de>; Fri, 11 Oct 2019 21:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728988AbfJKTPe (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 11 Oct 2019 15:15:34 -0400
Received: from mail-pf1-f202.google.com ([209.85.210.202]:43448 "EHLO
        mail-pf1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728976AbfJKTPe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Oct 2019 15:15:34 -0400
Received: by mail-pf1-f202.google.com with SMTP id i187so8206530pfc.10
        for <linux-doc@vger.kernel.org>; Fri, 11 Oct 2019 12:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=wwUIXG8zaTQahpGiWbKYxnh72iiHnCVZCniLVYgkymY=;
        b=SjWuOTsGX96zO37k1lrS0YGrpMuH9atVN00vNP8ziHSqCn5t4dh1R8CJorCFIjPdkg
         WEWKUOZPjx8vnNqtI6YQDXKsRyBAVvql3hBRri2FhH+wJ0084Fb4JXe0niwBFfhvnYmx
         PRw9piDFj/NQVRK8uguTgpNyFy1hd0f2bGlygLYPWJqEI/bfEIsGC7vIwGn4XrC154Cf
         CFNI4CQ1F5Bg649N5plNnllxLyf1xvpsBPAYffUiDd8QbDT+JZf0MTjcec0yP+Yh1ELW
         n845mj7mpnjt67qWFGOA8qyslxjBTS35v/vcpCBs0h0+KtkSBPxWDP/L07tiwi84Xc/Z
         2r0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=wwUIXG8zaTQahpGiWbKYxnh72iiHnCVZCniLVYgkymY=;
        b=VCWur33wV1tbhuJA3xSatHlvcFl1EecI1nqyD9MLlu52Adq45C6YOHugljWWXdxuZU
         S3xZxPirqAkeDs62O1on3py48on54D+H/VrzXEJX67b8iZpSkPscGLRa869M/1PBsXjr
         F2Clef3g3sczgHIi8UEMlo6fBP11QGAeTja5vmZyLTfpqsr8vvqD8Zkt+XM5IN0CWp2J
         7++7o1iOOx2HChCSMlS/Ix21zrurIQyAiw+rBYLgiOJFbiG8X4d89orfDLlO31mkd4z3
         iG0xwaJM79vXD1BiWaZs2TMc0XczfjfeR7pOXtPJRzrPY14XzLwnuqv76MgscsdodVdK
         q2oA==
X-Gm-Message-State: APjAAAXwdLO4CPXER9E1eoeJH4Q9Wsvxc915x2Emq3wLamnc2IKyYEi/
        G/CI8yqrjNZztCSjfOFiZgNHtqdEKtdYTfY=
X-Google-Smtp-Source: APXvYqzaCgjn0N9hABwlUZ7A/oUwETCiJvUmLoZt+RlNeEME8ZHLP4663B/JrOTQqolBHH7K1mL5F5e9EcUtEu0=
X-Received: by 2002:a63:6a46:: with SMTP id f67mr17738001pgc.87.1570821332209;
 Fri, 11 Oct 2019 12:15:32 -0700 (PDT)
Date:   Fri, 11 Oct 2019 12:15:20 -0700
In-Reply-To: <20191011191521.179614-1-saravanak@google.com>
Message-Id: <20191011191521.179614-3-saravanak@google.com>
Mime-Version: 1.0
References: <20191011191521.179614-1-saravanak@google.com>
X-Mailer: git-send-email 2.23.0.700.g56cf767bdb-goog
Subject: [PATCH v1 2/3] driver: core: Improve documentation for fwnode_operations.add_links()
From:   Saravana Kannan <saravanak@google.com>
To:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Stephen Boyd <sboyd@kernel.org>, kernel-team@android.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The add_links() ops shouldn't return on the first failed device link
add. It needs to continue trying to add device links to other suppliers
that are available. The documentation didn't explain WHY this behavior
is necessary. So, update the documentation with an example that explains
why this is necessary.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 include/linux/fwnode.h | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 6ae05b9ce359..97223e2410bd 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -71,8 +71,25 @@ struct fwnode_reference_args {
  *		links to all the suppliers of the device that are available at
  *		the time this function is called.  The function must NOT stop
  *		at the first failed device link if other unlinked supplier
- *		devices are present in the system.  If some suppliers are not
- *		yet available, this function will be called again when other
+ *		devices are present in the system.  This is necessary for the
+ *		driver/bus sync_state() callbacks to work correctly.
+ *
+ *		For example, say Device-C depends on suppliers Device-S1 and
+ *		Device-S2 and the dependency is listed in that order in the
+ *		firmware.  Say, S1 gets populated from the firmware after
+ *		late_initcall_sync().  Say S2 is populated and probed way
+ *		before that in device_initcall(). When C is populated, if this
+ *		add_links() function doesn't continue past a "failed linking to
+ *		S1" and continue linking C to S2, then S2 will get a
+ *		sync_state() callback before C is probed. This is because from
+ *		the perspective of S2, C was never a consumer when its
+ *		sync_state() evaluation is done. To avoid this, the add_links()
+ *		function has to go through all available suppliers of the
+ *		device (that corresponds to this fwnode) and link to them
+ *		before returning.
+ *
+ *		If some suppliers are not yet available (indicated by an error
+ *		return value), this function will be called again when other
  *		devices are added to allow creating device links to any newly
  *		available suppliers.
  *
-- 
2.23.0.700.g56cf767bdb-goog

