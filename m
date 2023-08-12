Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC02C779F4B
	for <lists+linux-doc@lfdr.de>; Sat, 12 Aug 2023 12:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235522AbjHLKsL (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 12 Aug 2023 06:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236988AbjHLKsH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Aug 2023 06:48:07 -0400
Received: from frasgout11.his.huawei.com (unknown [14.137.139.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 441AB271E;
        Sat, 12 Aug 2023 03:48:04 -0700 (PDT)
Received: from mail02.huawei.com (unknown [172.18.147.228])
        by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4RNHBs3cjgz9yydZ;
        Sat, 12 Aug 2023 18:36:21 +0800 (CST)
Received: from huaweicloud.com (unknown [10.204.63.22])
        by APP1 (Coremail) with SMTP id LxC2BwBXC7scY9dkThi9AA--.8440S5;
        Sat, 12 Aug 2023 11:47:36 +0100 (CET)
From:   Roberto Sassu <roberto.sassu@huaweicloud.com>
To:     corbet@lwn.net, zohar@linux.ibm.com, dmitry.kasatkin@gmail.com,
        paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, bpf@vger.kernel.org,
        jarkko@kernel.org, pbrobinson@gmail.com, zbyszek@in.waw.pl,
        hch@lst.de, mjg59@srcf.ucam.org, pmatilai@redhat.com,
        jannh@google.com, Roberto Sassu <roberto.sassu@huawei.com>
Subject: [RFC][PATCH v2 03/13] integrity/digest_cache: Add functions to populate and search
Date:   Sat, 12 Aug 2023 12:46:06 +0200
Message-Id: <20230812104616.2190095-4-roberto.sassu@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230812104616.2190095-1-roberto.sassu@huaweicloud.com>
References: <20230812104616.2190095-1-roberto.sassu@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: LxC2BwBXC7scY9dkThi9AA--.8440S5
X-Coremail-Antispam: 1UD129KBjvJXoWxtr43XFyDZr17Wr48Gr43trb_yoWxXrW5pa
        s7Cr1Utr4rZF13Cw17AF1ayr1SvrWqqF47Gw45Wr1ayr4DZr1jy3W8Aw1UXFy5Jr48Wa17
        tF4jgr1UCr1UXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUB2b4IE77IF4wAFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k2
        6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWw
        A2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
        w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
        WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
        Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ew
        Av7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY
        6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7V
        AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
        r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6x
        IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF
        04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
        CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUFYFCUUUUU
X-CM-SenderInfo: purev21wro2thvvxqx5xdzvxpfor3voofrz/1tbiAQAHBF1jj5KVZQAAsR
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        PDS_RDNS_DYNAMIC_FP,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_BL,
        RCVD_IN_MSPIKE_L3,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Roberto Sassu <roberto.sassu@huawei.com>

Add digest_cache_init_htable(), to size a hash table depending on the
number of digests to be added to the cache.

Add digest_cache_add() and digest_cache_lookup() to respectively add and
lookup a digest in the digest cache.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 security/integrity/digest_cache.c | 131 ++++++++++++++++++++++++++++++
 security/integrity/digest_cache.h |  24 ++++++
 2 files changed, 155 insertions(+)

diff --git a/security/integrity/digest_cache.c b/security/integrity/digest_cache.c
index 4201c68171a..d14d84b804b 100644
--- a/security/integrity/digest_cache.c
+++ b/security/integrity/digest_cache.c
@@ -315,3 +315,134 @@ struct digest_cache *digest_cache_get(struct dentry *dentry,
 
 	return iint->dig_user;
 }
+
+/**
+ * digest_cache_init_htable - Allocate and initialize the hash table
+ * @digest_cache: Digest cache
+ * @num_digests: Number of digests to add to the digest cache
+ *
+ * This function allocates and initializes the hash table. Its size is
+ * determined by the number of digests to add to the digest cache, known
+ * at this point by the parser calling this function.
+ *
+ * Return: Zero on success, a negative value otherwise.
+ */
+int digest_cache_init_htable(struct digest_cache *digest_cache,
+			     u64 num_digests)
+{
+	int i;
+
+	if (!digest_cache)
+		return 0;
+
+	digest_cache->num_slots = num_digests / DIGEST_CACHE_HTABLE_DEPTH;
+	if (!digest_cache->num_slots)
+		digest_cache->num_slots = 1;
+
+	digest_cache->slots = kmalloc_array(num_digests,
+					    sizeof(*digest_cache->slots),
+					    GFP_KERNEL);
+	if (!digest_cache->slots)
+		return -ENOMEM;
+
+	for (i = 0; i < digest_cache->num_slots; i++)
+		INIT_HLIST_HEAD(&digest_cache->slots[i]);
+
+	pr_debug("Initialized %d hash table slots for digest list %s\n",
+		 digest_cache->num_slots, digest_cache->path_str);
+	return 0;
+}
+
+/**
+ * digest_cache_add - Add a new digest to the digest cache
+ * @digest_cache: Digest cache
+ * @digest: Digest to add
+ *
+ * This function, invoked by a digest list parser, adds a digest extracted
+ * from a digest list to the digest cache.
+ *
+ * Return: Zero on success, a negative value on error.
+ */
+int digest_cache_add(struct digest_cache *digest_cache, u8 *digest)
+{
+	struct digest_cache_entry *entry;
+	unsigned int key;
+	int digest_len;
+
+	if (!digest_cache)
+		return 0;
+
+	digest_len = hash_digest_size[digest_cache->algo];
+
+	entry = kmalloc(sizeof(*entry) + digest_len, GFP_KERNEL);
+	if (!entry)
+		return -ENOMEM;
+
+	memcpy(entry->digest, digest, digest_len);
+
+	key = digest_cache_hash_key(digest, digest_cache->num_slots);
+	hlist_add_head(&entry->hnext, &digest_cache->slots[key]);
+	pr_debug("Add digest %s:%*phN from digest list %s\n",
+		 hash_algo_name[digest_cache->algo], digest_len, digest,
+		 digest_cache->path_str);
+	return 0;
+}
+
+/**
+ * digest_cache_lookup - Searches a digest in the digest cache
+ * @digest_cache: Digest cache
+ * @digest: Digest to search
+ * @algo: Algorithm of the digest to search
+ * @pathname: Path of the file whose digest is looked up
+ *
+ * This function, invoked by IMA or EVM, searches the calculated digest of
+ * a file or file metadata in the digest cache acquired with
+ * digest_cache_get().
+ *
+ * Return: Zero if the digest is found, a negative value if not.
+ */
+int digest_cache_lookup(struct digest_cache *digest_cache, u8 *digest,
+			enum hash_algo algo, const char *pathname)
+{
+	struct digest_cache_entry *entry;
+	unsigned int key;
+	int digest_len;
+	int search_depth = 0;
+
+	if (!digest_cache)
+		return -ENOENT;
+
+	if (digest_cache->algo == HASH_ALGO__LAST) {
+		pr_debug("Algorithm not set for digest list %s\n",
+			 digest_cache->path_str);
+		return -ENOENT;
+	}
+
+	digest_len = hash_digest_size[digest_cache->algo];
+
+	if (algo != digest_cache->algo) {
+		pr_debug("Algo mismatch for file %s, digest %s:%*phN in digest list %s (%s)\n",
+			 pathname, hash_algo_name[algo], digest_len, digest,
+			 digest_cache->path_str,
+			 hash_algo_name[digest_cache->algo]);
+		return -ENOENT;
+	}
+
+	key = digest_cache_hash_key(digest, digest_cache->num_slots);
+
+	hlist_for_each_entry_rcu(entry, &digest_cache->slots[key], hnext) {
+		if (!memcmp(entry->digest, digest, digest_len)) {
+			pr_debug("Cache hit at depth %d for file %s, digest %s:%*phN in digest list %s\n",
+				 search_depth, pathname, hash_algo_name[algo],
+				 digest_len, digest, digest_cache->path_str);
+			return 0;
+		}
+
+		search_depth++;
+	}
+
+	pr_debug("Cache miss for file %s, digest %s:%*phN in digest list %s\n",
+		 pathname, hash_algo_name[algo], digest_len, digest,
+		 digest_cache->path_str);
+	return -ENOENT;
+}
diff --git a/security/integrity/digest_cache.h b/security/integrity/digest_cache.h
index ff88e8593c6..01cd70f9850 100644
--- a/security/integrity/digest_cache.h
+++ b/security/integrity/digest_cache.h
@@ -66,6 +66,11 @@ static inline unsigned int digest_cache_hash_key(u8 *digest,
 void digest_cache_free(struct digest_cache *digest_cache);
 struct digest_cache *digest_cache_get(struct dentry *dentry,
 				      struct integrity_iint_cache *iint);
+int digest_cache_init_htable(struct digest_cache *digest_cache,
+			     u64 num_digests);
+int digest_cache_add(struct digest_cache *digest_cache, u8 *digest);
+int digest_cache_lookup(struct digest_cache *digest_cache, u8 *digest,
+			enum hash_algo algo, const char *pathname);
 #else
 static inline void digest_cache_free(struct digest_cache *digest_cache)
 {
@@ -77,5 +82,24 @@ digest_cache_get(struct dentry *dentry, struct integrity_iint_cache *iint)
 	return NULL;
 }
 
+static inline int digest_cache_init_htable(struct digest_cache *digest_cache,
+					   u64 num_digests)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int digest_cache_add(struct digest_cache *digest_cache,
+				   u8 *digest)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int digest_cache_lookup(struct digest_cache *digest_cache,
+				      u8 *digest, enum hash_algo algo,
+				      const char *pathname)
+{
+	return -ENOENT;
+}
+
 #endif /* CONFIG_INTEGRITY_DIGEST_CACHE */
 #endif /* _DIGEST_CACHE_H */
-- 
2.34.1

